
// This file is generated by src/Tools/generateTemaplates/templateClassPyExport.py out of the XML file
// Every change you make here get lost at the next full rebuild!
#ifndef APP_DOCUMENTOBJECTPY_H
#define APP_DOCUMENTOBJECTPY_H

#include <App/PropertyContainerPy.h>
#include <App/DocumentObject.h>
#include <string>

namespace App
{

//===========================================================================
// DocumentObjectPy - Python wrapper
//===========================================================================

/** The python export class for DocumentObject
 */
class AppExport DocumentObjectPy : public App::PropertyContainerPy
{
public:
    static PyTypeObject   Type;
    static PyMethodDef    Methods[];
    static PyGetSetDef    GetterSetter[];
    static PyParentObject Parents[];
    virtual PyTypeObject *GetType(void) {return &Type;};
    virtual PyParentObject *GetParents(void) {return Parents;}

public:
    DocumentObjectPy(DocumentObject *pcObject, PyTypeObject *T = &Type);
    static PyObject *PyMake(struct _typeobject *, PyObject *, PyObject *);
    virtual int PyInit(PyObject* args, PyObject*k);
    ~DocumentObjectPy();

    typedef DocumentObject* PointerType ;

    virtual PyObject *_repr(void);        // the representation
    std::string representation(void) const;

    /** @name callbacks and implementers for the python object methods */
    //@{
    /// callback for the touch() method
    static PyObject * staticCallback_touch (PyObject *self, PyObject *args);
    /// implementer for the touch() method
    PyObject*  touch(PyObject *args);
    /// callback for the purgeTouched() method
    static PyObject * staticCallback_purgeTouched (PyObject *self, PyObject *args);
    /// implementer for the purgeTouched() method
    PyObject*  purgeTouched(PyObject *args);
    //@}


    /** @name callbacks and implementers for the python object attributes */
    //@{
    ///getter callback for the OutList attribute
    static PyObject * staticCallback_getOutList (PyObject *self, void *closure);
    /// getter for the OutList attribute
    Py::List getOutList(void) const;
    /// setter callback for the OutList attribute
    static int staticCallback_setOutList (PyObject *self, PyObject *value, void *closure);
    // no setter method,  OutList is read only!
    ///getter callback for the InList attribute
    static PyObject * staticCallback_getInList (PyObject *self, void *closure);
    /// getter for the InList attribute
    Py::List getInList(void) const;
    /// setter callback for the InList attribute
    static int staticCallback_setInList (PyObject *self, PyObject *value, void *closure);
    // no setter method,  InList is read only!
    ///getter callback for the Name attribute
    static PyObject * staticCallback_getName (PyObject *self, void *closure);
    /// getter for the Name attribute
    Py::String getName(void) const;
    /// setter callback for the Name attribute
    static int staticCallback_setName (PyObject *self, PyObject *value, void *closure);
    // no setter method,  Name is read only!
    ///getter callback for the Document attribute
    static PyObject * staticCallback_getDocument (PyObject *self, void *closure);
    /// getter for the Document attribute
    Py::Object getDocument(void) const;
    /// setter callback for the Document attribute
    static int staticCallback_setDocument (PyObject *self, PyObject *value, void *closure);
    // no setter method,  Document is read only!
    ///getter callback for the State attribute
    static PyObject * staticCallback_getState (PyObject *self, void *closure);
    /// getter for the State attribute
    Py::List getState(void) const;
    /// setter callback for the State attribute
    static int staticCallback_setState (PyObject *self, PyObject *value, void *closure);
    // no setter method,  State is read only!
    ///getter callback for the ViewObject attribute
    static PyObject * staticCallback_getViewObject (PyObject *self, void *closure);
    /// getter for the ViewObject attribute
    Py::Object getViewObject(void) const;
    /// setter callback for the ViewObject attribute
    static int staticCallback_setViewObject (PyObject *self, PyObject *value, void *closure);
    // no setter method,  ViewObject is read only!
    //@}

    /// getter method for special attributes (e.g. dynamic ones)
    PyObject *getCustomAttributes(const char* attr) const;
    /// setter for special attributes (e.g. dynamic ones)
    int setCustomAttributes(const char* attr, PyObject *obj);
    PyObject *_getattr(char *attr);              // __getattr__ function
    int _setattr(char *attr, PyObject *value);        // __setattr__ function

    /// getter for the object handled by this class
    DocumentObject *getDocumentObjectPtr(void) const;

    /** @name additional declarations and methods for the wrapper class */
    //@{

    //@}
};

#define PARENTSAppDocumentObjectPy &DocumentObjectPy::Type,PARENTSAppPropertyContainerPy

}  //namespace App

#endif  // APP_DOCUMENTOBJECTPY_H


