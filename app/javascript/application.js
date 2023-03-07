// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as StimulusReflex from 'stimulus_reflex'
import { Application } from 'stimulus'
const application = Application.start()
StimulusReflex.initialize(application)
