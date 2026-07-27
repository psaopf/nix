{ pkgs, ... }:

{
  programs.vscodium = {
    enable = true;

    profiles.default = {
      userSettings = {
        # --- Theme: light, plain, like Notepad++ default ---
        "workbench.colorTheme" = "Default Light+";
        "workbench.iconTheme" = null;

        # --- Kill the extra UI chrome ---
        "workbench.activityBar.location" = "hidden";
        "workbench.statusBar.visible" = true;
        "breadcrumbs.enabled" = false;
        "editor.minimap.enabled" = false;
        "editor.glyphMargin" = false;
        "editor.folding" = false;
        "editor.lightbulb.enabled" = "off";
        "editor.renderLineHighlight" = "line";
        "editor.guides.indentation" = false;
        "editor.guides.bracketPairs" = false;

        # --- Sidebar / startup ---
        "workbench.sidebar.location" = "left";
        "workbench.startupEditor" = "none";

        # --- Tabs: simple, like NP++ tabs ---
        "workbench.editor.showTabs" = "single";
        "workbench.editor.tabSizing" = "shrink";
        "workbench.editor.enablePreview" = false;

        # --- Font ---
        "editor.fontFamily" = "Consolas, 'Courier New', monospace";
        "editor.fontSize" = 14;
        "editor.fontLigatures" = false;
        "editor.lineHeight" = 0;

	# --- Disable autocomplete / IntelliSense suggestions ---
	"editor.quickSuggestions" = {
	  other = false;
	  comments = false;
	  strings = false;
	};
	"editor.suggestOnTriggerCharacters" = false;   # you already have this
	"editor.acceptSuggestionOnEnter" = "off";
	"editor.acceptSuggestionOnCommitCharacter" = false;
	"editor.tabCompletion" = "off";
	"editor.wordBasedSuggestions" = "off";
	"editor.snippetSuggestions" = "none";
	"editor.suggest.showWords" = false;
	"editor.parameterHints.enabled" = false;       # you already have this
	"editor.inlineSuggest.enabled" = false;        # kills ghost-text/Copilot-style inline suggestions

        # --- Turn off IDE noise ---
        "explorer.compactFolders" = false;
        "explorer.decorations.badges" = false;
        "explorer.decorations.colors" = false;
        "problems.decorations.enabled" = false;
        "editor.codeLens" = false;
        "git.decorations.enabled" = false;
        "workbench.tips.enabled" = false;
        "extensions.ignoreRecommendations" = true;
        "telemetry.telemetryLevel" = "off";
        "update.mode" = "manual";
        "update.showReleaseNotes" = false;
        "workbench.enableExperiments" = false;
        "workbench.editorAssociations" = {
          "*.md" = "default";
        };

        # --- Window chrome ---
        "window.menuBarVisibility" = "classic";
        "window.commandCenter" = false;
        "workbench.layoutControl.enabled" = false;

        # --- File handling ---
        "files.autoSave" = "afterDelay";
        "files.autoSaveDelay" = 1000;
        "files.trimTrailingWhitespace" = false;

        # --- Disable all AI/Copilot/Chat features ---
        "chat.commandCenter.enabled" = false;
        "workbench.commandPalette.experimental.suggestCommands" = false;
        "github.copilot.enable" = {
          "*" = false;
        };
        "github.copilot.editor.enableAutoCompletions" = false;
        "inlineChat.enableV2" = false;
        "workbench.experimental.chat.enabled" = false;
        "chat.experimental.detectParticipant.enabled" = false;
        "chat.agent.enabled" = false;
        "github.copilot.chat.enabled" = false;
        "workbench.secondarySideBar.showChatSetup" = false;
        "workbench.chat.setupFromDialog" = false;
      };

      # No extensions — keep it stock, no fluff, no Copilot/Chat
      extensions = [ ];
    };
  };
}
