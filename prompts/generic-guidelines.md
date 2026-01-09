# Generic Prompting Guidelines

1. Instructions
   - Define:
     - `Who` -- encourage an LLM to act as a persona 
     - `Why is it important` -- motivation, larger goal, business value
     - `What are we trying to achieve` -- desired outcomes, deliverables, success criteria
2. Requirements -- How
   - Define:
     - `Steps to take` -- reasoning, tasks, actions 
     - `Conventions` -- style/tone, coding rules, system-design 
     - `Constraints` -- performance, security, test coverage, regulatory 
     - `Response format` -- JSON, XML, plain text 
     - `Examples` -- positive/negative, responses/behaviors
3. Knowledge 
   - Define:
     - **External Context:**
       - `Domain` -- strategy, business model, market facts 
       - `System` -- overall goals, other agents/services 
     - **Task Context**:
       - `Workflow` -- process steps, process, hand‑offs
       - `Documents` -- specs, procedures, tickets, logs
       - `Structured Data` -- variables, tables, arrays, JSON/XML
4. Memory: automatically attached by the orchestration layer or accessed as a tool
   - LLM Short-term memory -- previous messages, chat history 
   - State -- e.g., reasoning steps, progress 
   - LLM Long-term memory 
     - Semantic -- facts, preferences, user knowledge
     - Episodic -- experiences, past interactions
     - Procedural -- instructions from previous interactions
5. Tools
   1. Tool registration and spec 
      - The orchestration layer exposes each tool with a name, description, input schema (parameters), and output schema 
   2. LLM decides to call a tool
      - During generation the LLM emits a special tool-call token/intent with the chosen tool name and serialized arguments
   3. Orchestration executes the tool 
      - The system parses the call, performs authentication/validation, then invokes the external process/service (sync or async)
   4. Tool returns a structured result 
      - The tool responds with a structured payload (e.g., JSON) plus metadata (status, errors, provenance)
   5. System injects the result back to the LLM 
      - The orchestration layer attaches the tool result as a special message in the conversation so the LLM can consume it
   6. LLM integrates the result and continues 
      - The LLM updates its state, may perform further reasoning or additional tool calls, and finally produces the user-facing output

