import argparse
import wandb

class WandbArtifact:
    def __init__(self, project, artifact_name, artifact_type, file_path=None):
        self.project = project
        self.artifact_name = artifact_name
        self.artifact_type = artifact_type
        self.file_path = file_path
        wandb.login()

    def create_artifact(self):
        run = wandb.init(project=self.project, job_type='upload-dataset')
        artifact = wandb.Artifact(name=self.artifact_name, type=self.artifact_type)
        artifact.add_file(self.file_path)
        run.log_artifact(artifact)
        self.artifact = artifact

    def download_artifact(self, artifact_name_with_version):
        self.download_run = wandb.init(project=self.project, job_type="download_artifact")
        artifact = self.download_run.use_artifact(artifact_name_with_version)
        artifact_dir = artifact.download()
        self.download_run.finish()
        return artifact_dir

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="WandbArtifact command-line parameters")
    parser.add_argument("--project", type=str, required=True, help="Project name")
    parser.add_argument("--artifact_name", type=str, required=True, help="Artifact name")
    parser.add_argument("--artifact_type", type=str, required=True, help="Artifact type") # either 'dataset' or 'model'
    parser.add_argument("--file_path", type=str, required=True, help="File path (optional)")
    args = parser.parse_args()

    wandb_artifact = WandbArtifact(args.project, args.artifact_name, args.artifact_type, args.file_path)
    wandb_artifact.create_artifact()
