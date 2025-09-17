import * as vscode from "vscode";

import { setIsDevelopment } from "./state";
import * as luals from "./luals";

let myOutputChannel: vscode.OutputChannel;
let isLoaded = false;

export async function activate(context: vscode.ExtensionContext) {
	myOutputChannel = vscode.window.createOutputChannel("Daemonic API");
	context.subscriptions.push(myOutputChannel);
	myOutputChannel.appendLine("activate() func has been called");

	console.log("loaded", context.extension.id);
	setIsDevelopment(context.extensionMode === vscode.ExtensionMode.Development);
	registerActivationCommand(context);

	if (luals.isConfigured()) {
		myOutputChannel.appendLine("extension is configured, lets recheck it.");
		activateDaemonicExtension(context);
	}
}

async function activateDaemonicExtension(context: vscode.ExtensionContext) {
	isLoaded = true;
	luals.configLuaLS(false);
}

function registerActivationCommand(context: vscode.ExtensionContext) {
	const handler = () => {
		if (!isLoaded) {
			const daemonic_config = vscode.workspace.getConfiguration("daemonicAPI");
			// some users expect the extension to just work while not in an addon or workspace
			if (vscode.workspace.workspaceFolders) {
				daemonic_config.update("luals.configurationScope", "Workspace", vscode.ConfigurationTarget.Global);
				vscode.window.showInformationMessage("Activated Daemonic API extension (Workspace settings).");
			}
			else {
				daemonic_config.update("luals.configurationScope", "User", vscode.ConfigurationTarget.Global);
				vscode.window.showInformationMessage("Enabled Daemonic API extension (User settings).");
			}
			activateDaemonicExtension(context);
		}
		else {
			vscode.window.showInformationMessage("Daemonic API extension is already activated.");
		}
	};
	context.subscriptions.push(vscode.commands.registerCommand("daemonicAPI.activateExtension", handler));
}