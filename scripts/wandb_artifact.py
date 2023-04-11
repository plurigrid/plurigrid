import wandb

class WandbArtifact:
    def __init__(self, project, job_type, artifact_name, artifact_type, file_path=None):
        self.project = project
        self.job_type = job_type
        self.artifact_name = artifact_name
        self.artifact_type = artifact_type
        self.file_path = file_path
        wandb.login()

    def create_artifact(self):
        run = wandb.init(project=self.project, job_type=self.job_type)
        artifact = wandb.Artifact(name="example-artifact", type="dataset")
        artifact.add_file(self.file_path)
        run.log_artifact(artifact)
        self.artifact = wandb.Artifact(name=self.artifact_name, type=self.artifact_type)

    def add_file_to_artifact(self, file):
        self.artifact.add_file(file)

    def download_artifact(self, artifact_name_with_version):
        self.download_run = wandb.init(project=self.project, job_type="download_artifact")
        artifact = self.download_run.use_artifact(artifact_name_with_version)
        artifact_dir = artifact.download()
        self.download_run.finish()
        return artifact_dir
