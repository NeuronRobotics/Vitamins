
// This file is generated by src/Tools/generateTemaplates/templateClassPyExport.py out of the XML file
// Every change you make here get lost at the next full rebuild!
#ifndef PART_OFFSETSURFACEPY_H
#define PART_OFFSETSURFACEPY_H

#include <Mod/Part/App/GeometrySurfacePy.h>
#include <Mod/Part/App/Geometry.h>
#include <string>

namespace Part
{

//===========================================================================
// OffsetSurfacePy - Python wrapper
//===========================================================================

/** The python export class for GeomOffsetSurface
 */
class PartExport OffsetSurfacePy : public Part::GeometrySurfacePy
{
public:
    static PyTypeObject   Type;
    static PyMethodDef    Methods[];
    static PyGetSetDef    GetterSetter[];
    static PyParentObject Parents[];
    virtual PyTypeObject *GetType(void) {return &Type;};
    virtual PyParentObject *GetParents(void) {return Parents;}

public:
    OffsetSurfacePy(GeomOffsetSurface *pcObject, PyTypeObject *T = &Type);
    static PyObject *PyMake(struct _typeobject *, PyObject *, PyObject *);
    virtual int PyInit(PyObject* args, PyObject*k);
    ~OffsetSurfacePy();

    typedef GeomOffsetSurface* PointerType ;

    virtual PyObject *_repr(void);        // the representation
    std::string representation(void) const;

    /** @name callbacks and implementers for the python object methods */
    //@{
    /// callback for the uIso() method
    static PyObject * staticCallback_uIso (PyObject *self, PyObject *args);
    /// implementer for the uIso() method
    PyObject*  uIso(PyObject *args);
    /// callback for the vIso() method
    static PyObject * staticCallback_vIso (PyObject *self, PyObject *args);
    /// implementer for the vIso() method
    PyObject*  vIso(PyObject *args);
    //@}


    /** @name callbacks and implementers for the python object attributes */
    //@{
    ///getter callback for the OffsetValue attribute
    static PyObject * staticCallback_getOffsetValue (PyObject *self, void *closure);
    /// getter for the OffsetValue attribute
    Py::Float getOffsetValue(void) const;
    /// setter callback for the OffsetValue attribute
    static int staticCallback_setOffsetValue (PyObject *self, PyObject *value, void *closure);
    /// setter for the OffsetValue attribute
    void setOffsetValue(Py::Float arg);
    ///getter callback for the BasisSurface attribute
    static PyObject * staticCallback_getBasisSurface (PyObject *self, void *closure);
    /// getter for the BasisSurface attribute
    Py::Object getBasisSurface(void) const;
    /// setter callback for the BasisSurface attribute
    static int staticCallback_setBasisSurface (PyObject *self, PyObject *value, void *closure);
    /// setter for the BasisSurface attribute
    void setBasisSurface(Py::Object arg);
    //@}

    /// getter method for special attributes (e.g. dynamic ones)
    PyObject *getCustomAttributes(const char* attr) const;
    /// setter for special attributes (e.g. dynamic ones)
    int setCustomAttributes(const char* attr, PyObject *obj);
    PyObject *_getattr(char *attr);              // __getattr__ function
    int _setattr(char *attr, PyObject *value);        // __setattr__ function

    /// getter for the object handled by this class
    GeomOffsetSurface *getGeomOffsetSurfacePtr(void) const;

    /** @name additional declarations and methods for the wrapper class */
    //@{

    //@}
};

#define PARENTSPartOffsetSurfacePy &OffsetSurfacePy::Type,PARENTSPartGeometrySurfacePy

}  //namespace Part

#endif  // PART_OFFSETSURFACEPY_H


