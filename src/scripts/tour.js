import Shepherd from 'shepherd.js';

export function createTour(toursJson) {
  // Obtener la ruta actual
  const rutaActual = window.location.pathname;

  // Encontrar el tour correspondiente a la ruta actual
  const tourConfig = toursJson.find(tour => tour.ruta === rutaActual);

  // Si no se encuentra un tour para la ruta actual, no hacer nada
  if (!tourConfig) {
    console.log('No hay un tour configurado para esta ruta.');
    return;
  }

  // Crea una nueva instancia de Shepherd Tour
  let tour = new Shepherd.Tour({
    defaultStepOptions: {
      cancelIcon: {
        enabled: true
      }
    },
    useModalOverlay: true  // Habilita el efecto de oscurecimiento
  });

  // Verifica que todos los elementos del tour existan
  const allElementsExist = tourConfig.tour.every(step => document.querySelector(step.element));
  localStorage.setItem("tour_"+tourConfig.ruta, true);
  // Si no todos los elementos existen, no ejecuta el tour
  if (!allElementsExist) {
    console.log('No todos los elementos del tour están presentes en la vista.');
    return; // Sale de la función si no se encuentran todos los elementos
  }

  // Agrega pasos al tour si todos los elementos existen
  tourConfig.tour.forEach((step, index) => {
    let buttons = [];
    if (index !== 0) {
      buttons.push({
        text: 'Atrás',
        action: tour.back
      });
    }
    buttons.push({
      text: 'Siguiente',
      action: tour.next
    });

    tour.addStep({
      title: step.title,
      text: step.text,
      attachTo: {
        element: step.element,
        on: 'bottom'
      },
      buttons: buttons
    });
  });

  // Agrega un manejador de eventos para el evento 'cancel'
  tour.on('cancel', () => {
    console.log('El tour fue cancelado');
    // Aquí puedes agregar el código que quieras ejecutar cuando se cancele el tour
  });

  // Inicia el tour
  tour.start();
}