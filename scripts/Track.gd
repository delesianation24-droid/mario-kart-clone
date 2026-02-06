# Track Management and Checkpoint System

class Track:
    def __init__(self, track_id, checkpoints):
        self.track_id = track_id
        self.checkpoints = checkpoints
        self.current_checkpoint_index = 0

    def get_current_checkpoint(self):
        return self.checkpoints[self.current_checkpoint_index]

    def next_checkpoint(self):
        if self.current_checkpoint_index < len(self.checkpoints) - 1:
            self.current_checkpoint_index += 1
            return self.get_current_checkpoint()
        else:
            return None  # No more checkpoints

    def reset(self):
        self.current_checkpoint_index = 0

    def track_info(self):
        return f'Track ID: {self.track_id}, Total Checkpoints: {len(self.checkpoints)}'