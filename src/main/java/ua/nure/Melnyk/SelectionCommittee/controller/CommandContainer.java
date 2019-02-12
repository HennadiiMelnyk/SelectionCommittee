package ua.nure.Melnyk.SelectionCommittee.controller;

import javax.servlet.ServletContext;
import java.util.Map;

public class CommandContainer {

    /**
     * Returns command object with the given name.
     *
     * @param commandName Name of the command.
     * @return Command object.
     */
    public static Command get(String commandName, ServletContext servletContext) {
        Map<String, Command> commands = (Map<String, Command>) servletContext.getAttribute("commands");
        if (commandName == null || !commands.containsKey(commandName)) {
            //LOG.trace("Command not found, name --> " + commandName);
            return commands.get("noCommand");
        }

        return commands.get(commandName);
    }
}
