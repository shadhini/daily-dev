---
title: AI
render_with_liquid: false
---

# Artificial Intelligence

<table class="table table-hover table-bordered">
    <tbody>
        <tr>
            <td> GenAI </td>
            <td> the model; core capability </td>
        </tr>
        <tr>
            <td> Context window </td>
            <td> a hard constraint on how much the GenAI can consider at once </td>
        </tr>
        <tr>
            <td> Tooling (tool use) / Tool Calling </td>
            <td> a pattern to bypass or mitigate context limits by letting the model query external systems instead of encoding everything in the prompt </td>
        </tr>
        <tr>
            <td> AI agents </td>
            <td> orchestrate GenAI + tooling + memory + planner to accomplish complex, multi-step tasks </td>
        </tr>
        <tr>
            <td> MCP: Model Control Plane </td>
            <td> governs, routes, secures, and observes GenAI + tools + agent orchestration at org scale </td>
        </tr>
        <tr>
            <td> MCP: Model Context Protocol </td>
            <td> a structured envelope for what you send to / receive from a model -- it's about input/output data shape, provenance and runtime constraints </td>
        </tr>
    </tbody>
</table>



`GenAI`: Generative AI
- large models that generate content (text, code, images, audio)
- **Role**: the core “reasoning + generation” capability
- **Limits**: 
  - hallucination/incorrect facts
  - sensitivity to prompt phrasing
  - bounded by training data,
  - constrained by runtime context (`context window`)
**Context Window Problem**
- the limitation on how many tokens the model can attend to in a single prompt/response
- Symptoms: 
  - truncated history
  - degraded reasoning on long documents
  - loss of earlier context
**Tool Calling**
- the pattern of letting the model call external tools (search, DBs, code runners, calculators, APIs) rather than putting everything into the context window
- effectively “extends” the model’s capability beyond the token limits by offloading data/state/compute or access to specialized systems
**AI agents**
- orchestrations that combine a GenAI model with planning, tool selection, memory, and action execution 
  - e.g., planner -> choose tool -> execute -> observe -> update plan
- Use cases: multi-step tasls (research, booking, complex automation)
**MCP**: Model Control Plane
- Control-plane infrastructure that manages models, routing, policy, observability, audit logs, access control, cost/budgeting, versioning, and possibly deployment of tool adapters
- analogue: like the operations center that keeps your AI models running in production (deployment, scaling, monitoring)
**MCP**: Model Context Protocol
- it's about input/output data shape, provenance and runtime constraints
- analogue: like a universal adapter that lets AI models plug into any data source or tool they need to answer questions better
- companies who want AI agents too work with their products use this method


## AI Models & Tools

`Claude`
- `Claude Code`
  - a terminal/IDE assistant that executes agentic actions (editing files, running tests, making commits) 
    - while the Claude model (Opus/Sonnet/Haiku - depending on configuration) supplies reasoning and generation
- `Claude Opus` 
  - flagship
  - highest reasoning and code capability
  - best for deep/complex tasks
  - slowest and most expensive
- `Claude Sonnet` 
  - balanced “workhorse”: good accuracy, speed, and cost for general tasks including coding and analysis
- `Claude Haiku` 
  - fastest and cheapest
  - for high-volume low-complexity tasks and real-time use
  - lower depth

## `Claude Code` Magic Tricks 
for better development of software solutions upon user requests

`compacts`
- when it runs out of context window, it “compacts” prior conversation history and takes notes about exactly where it was when it stopped
- then it clears its context window and fresh version of the conversation starts with reviewing the notes taken
`skills`
- picks up skills as needed from a prior configured curated list of skills in natural language
  - skills -> instructions -- prompts, sets of tools needed for specific tasks
- [free list of skills](https://github.com/obra/superpowers)
- Claude Code slash command `/skills` lets you create or download skills
`subagents`
- spawn specialized subagents for specific tasks (e.g., code analysis, testing, documentation)
- allows to run many different processes at once in parallel
- Claude Code slash command `/agents` lets you set up subagents

