# replace sbatch

import submitit
import glob
import numpy as np

from functools import partial
from faster_whisper import WhisperModel


def transcribe_single_file(model: WhisperModel, audio_path: str) -> str:
    """Transcribe a single audio file using the provided model."""
    segments, _ = model.transcribe(audio_path)
    return " ".join(list(segments))


def save_transcript_as_txt(audio_path: str, transcript: str):
    """Save the audio transcript file as a txt file."""
    with open(f"{audio_path}_transcript.txt", "w") as txt_file:
        txt_file.write(transcript)


def transcribe_audio_files(model_type: str, audio_paths: list[str]):
    """Run a speech recognition model over a list of audio files and save the results."""
    model = WhisperModel(model_type, device="cuda")
    for audio_path in audio_paths:
        try:
            transcript = transcribe_single_file(model, audio_path)
            save_transcript_as_txt(audio_path, transcript)
        except Exception as e:
            print(f"Error processing {audio_path}: {e}")


if __name__ == "__main__":
    n_nodes = 10

    # Init the executor, which is the submission interface
    executor = submitit.AutoExecutor(folder="logs/")

    # Specify the Slurm parameters
    executor.update_parameters(
        slurm_partition="gpu-queue",
        slurm_array_parallelism=5,    # Limit job concurrency to 5 jobs at a time
        nodes=1,                      # Each job in the job array gets one node
        timeout_min=10 * 60,          # Limit the job running time to 10 hours
        slurm_gpus_per_node=1,        # Each node should use 1 GPU
        )

    # Define parameters
    all_audio_paths = glob.glob("dataset_dir/*.wav")
    audio_paths = np.array_split(all_audio_paths, n_nodes)
    model_type = "large-v2"

    # Submit your function and inputs as a job array. This will launch 10 jobs.
    # By using partial we avoid repeating the model argument for each data chunk.
    jobs = executor.map_array(partial(transcribe_audio_files, model_type), audio_paths) 

    # Monitor jobs to keep track of completed jobs
    submitit.helpers.monitor_jobs(jobs)


