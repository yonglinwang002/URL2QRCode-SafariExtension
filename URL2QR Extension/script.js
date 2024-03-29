//document.addEventListener("DOMContentLoaded", function(event) {
//    safari.extension.dispatchMessage("PageLoad");
//});

//// Listens for messages sent from the app extension's Swift code.
//safari.self.addEventListener("message", messageHandler);
//
//function messageHandler(event)
//{
//    if (event.name === "WordsAndReplacements") {
//        // The userInfo of the call to -[SFSafariPage dispatchMessageToScriptWithName:userInfo:].
//        var wordReplacementMap = event.message;
//        for (var wordToReplace in wordReplacementMap) {
//            replace(document.body, wordToReplace, wordReplacementMap[wordToReplace]);
//        }
////        alert('OK');
//    }
//}
//
//function replace(node, word, replacement) {
//    switch (node.nodeType)
//    {
//        case Node.ELEMENT_NODE:
//            // We don't want to replace text in an input field or textarea.
//            if (node.tagName.toLowerCase() === "input" || node.tagName.toLowerCase() === "textarea") {
//                return;
//            }
//
//            // For other types of element nodes, we explicitly fall through to iterate over their children.
//        case Node.DOCUMENT_NODE:
//        case Node.DOCUMENT_FRAGMENT_NODE:
//            // If the node is a container node, iterate over all the children and recurse into them.
//            var child = node.firstChild;
//            var next = undefined;
//            while (child) {
//                next = child.nextSibling;
//                replace(child, word, replacement);
//                child = next;
//            }
//            break;
//        case Node.TEXT_NODE:
//            // If the node is a text node, perform the text replacement.
//            replaceTextInTextNode(node, word, replacement);
//            break;
//    }
//}
//
//function replaceTextInTextNode(textNode, word, replacement) {
//    // Skip over nodes that aren't text nodes.
//    if (textNode.nodeType !== Node.TEXT_NODE)
//        return;
//
//    // And text nodes that don't have any text.
//    if (!textNode.nodeValue.length)
//        return;
//
//    // Generate a regular expression object to perform the replacement.
//    var expressionForWordToReplace = new RegExp(word, "gi");
//    var nodeValue = textNode.nodeValue;
//    var newNodeValue = nodeValue.replace(expressionForWordToReplace, replacement);
//
//    // Perform the replacement in the DOM if the regular expression had any effect.
//    if (nodeValue !== newNodeValue) {
//        textNode.nodeValue = newNodeValue;
//    }
//}
