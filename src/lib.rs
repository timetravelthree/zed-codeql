use zed_extension_api as zed;

struct CodeqlExtension;

impl zed::Extension for CodeqlExtension {
    fn new() -> Self {
        Self {}
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &zed::LanguageServerId,
        _worktree: &zed::Worktree,
    ) -> zed::Result<zed::Command> {
        eprintln!("Starting CodeQL language server...");
        Ok(zed::Command {
            command: "/opt/homebrew/bin/codeql".to_string(),
            args: vec![
                "execute".to_string(),
                "language-server".to_string(),
                "--check-errors=ON_CHANGE".to_string(),
            ],
            env: Default::default(),
        })
    }
}

zed::register_extension!(CodeqlExtension);
