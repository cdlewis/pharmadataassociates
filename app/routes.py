from flask import (
    Blueprint,
    abort,
    redirect,
    render_template,
    url_for,
)


handlers = Blueprint('handlers', __name__)


@handlers.route("/")
def index():
    return render_template("index.htm")


pages = {
    "about_us": "about_us.htm",
    "capabilities": "capabilities.htm",
    "careers": "careers.htm",
    "case_studies": "case_studies.htm",
    "contact": "contact.htm",
    "experience": "experience.htm",
    "references": "references.htm",
    "technology": "technology.htm",
    "robots.txt": "robots.txt",
}


redirects = {
    "home": "/",
    "AboutUs": "/about_us",
    "Capabilities": "/capabilities",
    "Careers": "/careers",
    "CaseStudies": "/case_studies",
    "Contact": "/contact",
    "Experience": "/experience",
    "References": "/references",
    "Technology": "/technology",
}


@handlers.route("/<route>", methods=['GET'])
def catchall_route(route):
    if route in pages:
        return render_template(pages[route])
    if route in redirects:
        return redirect(redirects[route])
    abort(404)


def sitemap_urls():
    for route in pages:
        yield url_for('handlers.catchall_route', route=route, _external=True)
