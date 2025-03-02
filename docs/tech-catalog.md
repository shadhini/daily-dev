---
title: "Tech Catalog"
---

# Tech Catalog

## Technologies
<table class="table table-hover table-bordered">
    <thead>
    <tr>
        <th></th>
        <th class="text-success-emphasis">Similar Technologies</th>
        <th class="text-success-emphasis">Related Technologies</th>
        <th class="text-success-emphasis">Related Topics</th>
    </tr>
    </thead>
    <tbody>
    {% for technology in site.technologies %}
        <tr>
            <!-- Technology Name -->
            <td><strong class="text-success-emphasis">{{ technology.title }}</strong></td>
            <!-- Similar Technologies -->
            <td>
                {% for similar_technology in site.data.technologies[technology.slug].similar-technologies %}
                {% assign similar_technology_slug = similar_technology | slugify %}
                <span class="badge bg-secondary">
                    <a href="{{ site.baseurl }}/technologies/{{ similar_technology_slug }}" target="_blank" data-bs-theme="light">
                        {{ similar_technology }}
                    </a>
                </span>
                {% endfor %}
            </td>
            <!-- Related Technologies -->
            <td>
                {% for related_technology in site.data.technologies[technology.slug].related-technologies %}
                {% assign related_technology_slug = related_technology | slugify %}
                <span class="badge bg-secondary">
                    <a href="{{ site.baseurl }}/technologies/{{ related_technology_slug }}" target="_blank" data-bs-theme="light">
                        {{ related_technology }}
                    </a>
                </span>
                {% endfor %}
            </td>
            <!-- Related Topics -->
            <td>
                {% for topic in site.data.technologies[technology.slug].topics %}
                {% assign topic_slug = topic | slugify %}
                <span class="badge bg-secondary">
                    <a href="{{ site.baseurl }}/topics/{{ topic_slug }}" target="_blank" data-bs-theme="light">
                        {{ topic }}
                    </a>
                </span>
                {% endfor %}
            </td>       
        </tr>
        <tr>
            <td></td>
            <!-- Important Links -->
            <td colspan="3">
                <div class="accordion" id="important{{ technology.slug }}">
                    <div class="accordion-item">
                            <span class="accordion-header">
                              <button class="accordion-button text-primary-emphasis" type="button" data-bs-toggle="collapse" data-bs-target="#collapseImportant{{ technology.slug }}" aria-expanded="true" aria-controls="collapseImportant{{ technology.slug }}">
                                 Important Links
                              </button>
                            </span>
                        <div id="collapseImportant{{ technology.slug }}" class="accordion-collapse collapse" data-bs-parent="#important{{ technology.slug }}">
                            <div class="accordion-body">
                                {% for link in site.data.technologies[technology.slug].important %}
                                <li><a href="{{ link.url }}" target="_blank">{{ link.name }}</a></li>
                                {% endfor %}
                            </div>
                        </div>
                    </div>
                </div> 
            </td>
        </tr>
    {% endfor %}
    </tbody>
</table>


## Topics

<table class="table table-hover table-bordered">
    <thead>
    <tr>
        <th></th>
        <th class="text-success-emphasis">Related Technologies</th>
        <th class="text-success-emphasis">Related Topics</th>
    </tr>
    </thead>
    <tbody>
    {% for topic in site.topics %}
        <tr>
            <!-- Topic Name -->
            <td><strong class="text-success-emphasis">{{ topic.title }}</strong></td>
            <!-- Related Technologies -->
            <td>
                {% for technology in site.data.topics[topic.slug].technologies %}
                {% assign technology_slug = technology | slugify %}
                <span class="badge bg-secondary">
                    <a href="{{ site.baseurl }}/technologies/{{ technology_slug }}" target="_blank" data-bs-theme="light">
                        {{ technology }}
                    </a>
                </span>
                {% endfor %}
            </td>
            <!-- Related Topics -->
            <td>
                {% for related_topic in site.data.topics[topic.slug].related-topics %}
                {% assign related_topic_slug = related_topic | slugify %}
                <span class="badge bg-secondary">
                    <a href="{{ site.baseurl }}/topics/{{ related_topic_slug }}" target="_blank" data-bs-theme="light">
                        {{ related_topic }}
                    </a>
                </span>
                {% endfor %}
            </td>
        </tr>
        <tr>
            <td></td>
            <!-- Important Links -->
            <td colspan="2">
                <div class="accordion" id="important{{ topic.slug }}">
                    <div class="accordion-item">
                            <span class="accordion-header">
                              <button class="accordion-button text-primary-emphasis" type="button" data-bs-toggle="collapse" data-bs-target="#collapseImportant{{ topic.slug }}" aria-expanded="true" aria-controls="collapseImportant{{ topic.slug }}">
                                 Important Links
                              </button>
                            </span>
                        <div id="collapseImportant{{ topic.slug }}" class="accordion-collapse collapse" data-bs-parent="#important{{ topic.slug }}">
                            <div class="accordion-body">
                                {% for link in site.data.topics[topic.slug].important %}
                                <li><a href="{{ link.url }}" target="_blank">{{ link.name }}</a></li>
                                {% endfor %}
                            </div>
                        </div>
                    </div>
                </div> 
            </td>
        </tr>
    {% endfor %}
    </tbody>
</table>