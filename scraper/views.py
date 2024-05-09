"""
from django.shortcuts import render
import logging

# Create your views here.

# Set up logging
logger = logging.getLogger(__name__)


def sample_view(request):
    context = {
        'name': 'Django',
        'users': ['Alice', 'Bob', 'Charlie']
    }
    # Log the context data
    logger.debug(f"Rendering template with context: {context}")
    return render(request, 'sample_template.html', context)
"""