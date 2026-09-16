import { Worker, Viewer } from '@react-pdf-viewer/core';
import { defaultLayoutPlugin } from '@react-pdf-viewer/default-layout';
// Self-hosted via the pdfjs-dist dependency already in package.json, instead of fetching the
// worker from unpkg.com at runtime (no external CDN dependency, works offline).
import pdfWorkerUrl from 'pdfjs-dist/build/pdf.worker.min.js?url';

const PdfViewer = ({ fileUrl }) => {
  const defaultLayoutPluginInstance = defaultLayoutPlugin();

  return (
    <Worker workerUrl={pdfWorkerUrl}>
      <div className="h-full w-full">
        <Viewer
          fileUrl={fileUrl}
          plugins={[defaultLayoutPluginInstance]}
        />
      </div>
    </Worker>
  );
};

export default PdfViewer;