
// This file is generated by src/Tools/generateTemaplates/templateClassPyExport.py out of the .XML file
// Every change you make here get lost at the next full rebuild!
// This File is normaly build as an include in ParabolaPyImp.cpp! Its not intended to be in a project!

#include <boost/filesystem/path.hpp>
#include <boost/filesystem/operations.hpp>
#include <boost/filesystem/exception.hpp>
#include <Base/PyObjectBase.h>
#include <Base/Console.h>
#include <Base/Exception.h>
#include <CXX/Objects.hxx>

#define new DEBUG_CLIENTBLOCK

using Base::streq;
using namespace Part;

/// Type structure of ParabolaPy
PyTypeObject ParabolaPy::Type = {
    PyObject_HEAD_INIT(&PyType_Type)
    0,                                                /*ob_size*/
    "Part.GeomParabola",     /*tp_name*/
    sizeof(ParabolaPy),                       /*tp_basicsize*/
    0,                                                /*tp_itemsize*/
    /* methods */
    PyDestructor,                                     /*tp_dealloc*/
    0,                                                /*tp_print*/
    __getattr,                                        /*tp_getattr*/
    __setattr,                                        /*tp_setattr*/
    0,                                                /*tp_compare*/
    __repr,                                           /*tp_repr*/
    0,                                                /*tp_as_number*/
    0,                                                /*tp_as_sequence*/
    0,                                                /*tp_as_mapping*/
    0,                                                /*tp_hash*/
    0,                                                /*tp_call */
    0,                                                /*tp_str  */
    0,                                                /*tp_getattro*/
    0,                                                /*tp_setattro*/
    /* --- Functions to access object as input/output buffer ---------*/
    0,                                                /* tp_as_buffer */
    /* --- Flags to define presence of optional/expanded features */
    Py_TPFLAGS_BASETYPE|Py_TPFLAGS_HAVE_CLASS,        /*tp_flags */
    "Describes a parabola in 3D space",           /*tp_doc */
    0,                                                /*tp_traverse */
    0,                                                /*tp_clear */
    0,                                                /*tp_richcompare */
    0,                                                /*tp_weaklistoffset */
    0,                                                /*tp_iter */
    0,                                                /*tp_iternext */
    Part::ParabolaPy::Methods,                     /*tp_methods */
    0,                                                /*tp_members */
    Part::ParabolaPy::GetterSetter,                     /*tp_getset */
    &Part::GeometryCurvePy::Type,                        /*tp_base */
    0,                                                /*tp_dict */
    0,                                                /*tp_descr_get */
    0,                                                /*tp_descr_set */
    0,                                                /*tp_dictoffset */
    __PyInit,                                         /*tp_init */
    0,                                                /*tp_alloc */
    Part::ParabolaPy::PyMake,/*tp_new */
    0,                                                /*tp_free   Low-level free-memory routine */
    0,                                                /*tp_is_gc  For PyObject_IS_GC */
    0,                                                /*tp_bases */
    0,                                                /*tp_mro    method resolution order */
    0,                                                /*tp_cache */
    0,                                                /*tp_subclasses */
    0,                                                /*tp_weaklist */
    0                                                 /*tp_del */
};

/// Methods structure of ParabolaPy
PyMethodDef ParabolaPy::Methods[] = {
    {"compute",
        (PyCFunction) staticCallback_compute,
        METH_VARARGS,
        "\n					compute(p1,p2,p3)\n					The three points must lie on a plane parallel to xy plane and must not be collinear\n				"
    },
    {NULL, NULL, 0, NULL}		/* Sentinel */
};



/// Attribute structure of ParabolaPy
PyGetSetDef ParabolaPy::GetterSetter[] = {
    {"Eccentricity",
        (getter) staticCallback_getEccentricity,
        (setter) staticCallback_setEccentricity, 
        "Returns 1. (which is the eccentricity of any parabola).",
        NULL
    },
    {"Focal",
        (getter) staticCallback_getFocal,
        (setter) staticCallback_setFocal, 
        "The focal distance is the distance between\nthe apex and the focus of the parabola.",
        NULL
    },
    {"Focus",
        (getter) staticCallback_getFocus,
        (setter) staticCallback_setFocus, 
        "The focus is on the positive side of the\n'X Axis' of the local coordinate system of the parabola.",
        NULL
    },
    {"Parameter",
        (getter) staticCallback_getParameter,
        (setter) staticCallback_setParameter, 
        "Compute the parameter of this parabola\nwhich is the distance between its focus\nand its directrix. This distance is twice the focal length.\n				",
        NULL
    },
    {"Location",
        (getter) staticCallback_getLocation,
        (setter) staticCallback_setLocation, 
        "Location of the parabola",
        NULL
    },
    {"Axis",
        (getter) staticCallback_getAxis,
        (setter) staticCallback_setAxis, 
        "The axis direction of the parabola",
        NULL
    },
    {NULL, NULL, NULL, NULL, NULL}		/* Sentinel */
};

// compute() callback and implementer
// PyObject*  ParabolaPy::compute(PyObject *args){};
// has to be implemented in ParabolaPyImp.cpp
PyObject * ParabolaPy::staticCallback_compute (PyObject *self, PyObject *args)
{
    // test if twin object not allready deleted
    if (!((PyObjectBase*) self)->isValid()){
        PyErr_SetString(PyExc_ReferenceError, "This object is already deleted most likely through closing a document. This reference is no longer valid!");
        return NULL;
    }

    // test if object is set Const
    if (((PyObjectBase*) self)->isConst()){
        PyErr_SetString(PyExc_ReferenceError, "This object is immutable, you can not set any attribute or call a non const method");
        return NULL;
    }

    try { // catches all exceptions coming up from c++ and generate a python exception
        PyObject* ret = ((ParabolaPy*)self)->compute(args);
        if (ret != 0)
            ((ParabolaPy*)self)->startNotify();
        return ret;
    }
    catch(const Base::Exception& e) // catch the FreeCAD exceptions
    {
        std::string str;
        str += "FreeCAD exception thrown (";
        str += e.what();
        str += ")";
        e.ReportException();
        PyErr_SetString(PyExc_Exception,str.c_str());
        return NULL;
    }
    catch(const boost::filesystem::filesystem_error& e) // catch boost filesystem exception
    {
        std::string str;
        str += "File system exception thrown (";
        //str += e.who();
        //str += ", ";
        str += e.what();
        str += ")\n";
        Base::Console().Error(str.c_str());
        PyErr_SetString(PyExc_Exception,str.c_str());
        return NULL;
    }
    catch(const Py::Exception&)
    {
        // The exception text is already set
        return NULL;
    }
    catch(const char* e) // catch simple string exceptions
    {
        Base::Console().Error(e);
        PyErr_SetString(PyExc_Exception,e);
        return NULL;
    }
    // in debug not all exceptions will be catched to get the attention of the developer!
#ifndef DONT_CATCH_CXX_EXCEPTIONS 
    catch(const std::exception& e) // catch other c++ exceptions
    {
        std::string str;
        str += "FC++ exception thrown (";
        str += e.what();
        str += ")";
        Base::Console().Error(str.c_str());
        PyErr_SetString(PyExc_Exception,str.c_str());
        return NULL;
    }
    catch(...)  // catch the rest!
    {
        PyErr_SetString(PyExc_Exception,"Unknown C++ exception");
        return NULL;
    }
#endif
}

// Eccentricity() callback and implementer
// PyObject*  ParabolaPy::Eccentricity(PyObject *args){};
// has to be implemented in ParabolaPyImp.cpp
PyObject * ParabolaPy::staticCallback_getEccentricity (PyObject *self, void * /*closure*/)
{
    if (!((PyObjectBase*) self)->isValid()){
        PyErr_SetString(PyExc_ReferenceError, "This object is already deleted most likely through closing a document. This reference is no longer valid!");
        return NULL;
    }

    try {
        return Py::new_reference_to(((ParabolaPy*)self)->getEccentricity());
    } catch (const Py::Exception&) {
        // The exception text is already set
        return NULL;
    } catch (...) {
        PyErr_SetString(PyExc_Exception, "Unknown exception while reading attribute 'Eccentricity' of object 'GeomParabola'");
        return NULL;
    }
}

int ParabolaPy::staticCallback_setEccentricity (PyObject *self, PyObject * /*value*/, void * /*closure*/)
{
    if (!((PyObjectBase*) self)->isValid()){
        PyErr_SetString(PyExc_ReferenceError, "This object is already deleted most likely through closing a document. This reference is no longer valid!");
        return -1;
    }

    PyErr_SetString(PyExc_AttributeError, "Attribute 'Eccentricity' of object 'GeomParabola' is read-only");
    return -1;
}

// Focal() callback and implementer
// PyObject*  ParabolaPy::Focal(PyObject *args){};
// has to be implemented in ParabolaPyImp.cpp
PyObject * ParabolaPy::staticCallback_getFocal (PyObject *self, void * /*closure*/)
{
    if (!((PyObjectBase*) self)->isValid()){
        PyErr_SetString(PyExc_ReferenceError, "This object is already deleted most likely through closing a document. This reference is no longer valid!");
        return NULL;
    }

    try {
        return Py::new_reference_to(((ParabolaPy*)self)->getFocal());
    } catch (const Py::Exception&) {
        // The exception text is already set
        return NULL;
    } catch (...) {
        PyErr_SetString(PyExc_Exception, "Unknown exception while reading attribute 'Focal' of object 'GeomParabola'");
        return NULL;
    }
}

int ParabolaPy::staticCallback_setFocal (PyObject *self, PyObject *value, void * /*closure*/)
{    
    if (!((PyObjectBase*) self)->isValid()){
        PyErr_SetString(PyExc_ReferenceError, "This object is already deleted most likely through closing a document. This reference is no longer valid!");
        return -1;
    }
    if (((PyObjectBase*) self)->isConst()){
        PyErr_SetString(PyExc_ReferenceError, "This object is immutable, you can not set any attribute or call a method");
        return -1;
    }

    try {
        ((ParabolaPy*)self)->setFocal(Py::Float(value,false));
        return 0;
    } catch (const Py::Exception&) {
        // The exception text is already set
        return -1;
    } catch (...) {
        PyErr_SetString(PyExc_Exception, "Unknown exception while writing attribute 'Focal' of object 'GeomParabola'");
        return -1;
    }
}

// Focus() callback and implementer
// PyObject*  ParabolaPy::Focus(PyObject *args){};
// has to be implemented in ParabolaPyImp.cpp
PyObject * ParabolaPy::staticCallback_getFocus (PyObject *self, void * /*closure*/)
{
    if (!((PyObjectBase*) self)->isValid()){
        PyErr_SetString(PyExc_ReferenceError, "This object is already deleted most likely through closing a document. This reference is no longer valid!");
        return NULL;
    }

    try {
        return Py::new_reference_to(((ParabolaPy*)self)->getFocus());
    } catch (const Py::Exception&) {
        // The exception text is already set
        return NULL;
    } catch (...) {
        PyErr_SetString(PyExc_Exception, "Unknown exception while reading attribute 'Focus' of object 'GeomParabola'");
        return NULL;
    }
}

int ParabolaPy::staticCallback_setFocus (PyObject *self, PyObject * /*value*/, void * /*closure*/)
{
    if (!((PyObjectBase*) self)->isValid()){
        PyErr_SetString(PyExc_ReferenceError, "This object is already deleted most likely through closing a document. This reference is no longer valid!");
        return -1;
    }

    PyErr_SetString(PyExc_AttributeError, "Attribute 'Focus' of object 'GeomParabola' is read-only");
    return -1;
}

// Parameter() callback and implementer
// PyObject*  ParabolaPy::Parameter(PyObject *args){};
// has to be implemented in ParabolaPyImp.cpp
PyObject * ParabolaPy::staticCallback_getParameter (PyObject *self, void * /*closure*/)
{
    if (!((PyObjectBase*) self)->isValid()){
        PyErr_SetString(PyExc_ReferenceError, "This object is already deleted most likely through closing a document. This reference is no longer valid!");
        return NULL;
    }

    try {
        return Py::new_reference_to(((ParabolaPy*)self)->getParameter());
    } catch (const Py::Exception&) {
        // The exception text is already set
        return NULL;
    } catch (...) {
        PyErr_SetString(PyExc_Exception, "Unknown exception while reading attribute 'Parameter' of object 'GeomParabola'");
        return NULL;
    }
}

int ParabolaPy::staticCallback_setParameter (PyObject *self, PyObject * /*value*/, void * /*closure*/)
{
    if (!((PyObjectBase*) self)->isValid()){
        PyErr_SetString(PyExc_ReferenceError, "This object is already deleted most likely through closing a document. This reference is no longer valid!");
        return -1;
    }

    PyErr_SetString(PyExc_AttributeError, "Attribute 'Parameter' of object 'GeomParabola' is read-only");
    return -1;
}

// Location() callback and implementer
// PyObject*  ParabolaPy::Location(PyObject *args){};
// has to be implemented in ParabolaPyImp.cpp
PyObject * ParabolaPy::staticCallback_getLocation (PyObject *self, void * /*closure*/)
{
    if (!((PyObjectBase*) self)->isValid()){
        PyErr_SetString(PyExc_ReferenceError, "This object is already deleted most likely through closing a document. This reference is no longer valid!");
        return NULL;
    }

    try {
        return Py::new_reference_to(((ParabolaPy*)self)->getLocation());
    } catch (const Py::Exception&) {
        // The exception text is already set
        return NULL;
    } catch (...) {
        PyErr_SetString(PyExc_Exception, "Unknown exception while reading attribute 'Location' of object 'GeomParabola'");
        return NULL;
    }
}

int ParabolaPy::staticCallback_setLocation (PyObject *self, PyObject *value, void * /*closure*/)
{    
    if (!((PyObjectBase*) self)->isValid()){
        PyErr_SetString(PyExc_ReferenceError, "This object is already deleted most likely through closing a document. This reference is no longer valid!");
        return -1;
    }
    if (((PyObjectBase*) self)->isConst()){
        PyErr_SetString(PyExc_ReferenceError, "This object is immutable, you can not set any attribute or call a method");
        return -1;
    }

    try {
        ((ParabolaPy*)self)->setLocation(Py::Object(value,false));
        return 0;
    } catch (const Py::Exception&) {
        // The exception text is already set
        return -1;
    } catch (...) {
        PyErr_SetString(PyExc_Exception, "Unknown exception while writing attribute 'Location' of object 'GeomParabola'");
        return -1;
    }
}

// Axis() callback and implementer
// PyObject*  ParabolaPy::Axis(PyObject *args){};
// has to be implemented in ParabolaPyImp.cpp
PyObject * ParabolaPy::staticCallback_getAxis (PyObject *self, void * /*closure*/)
{
    if (!((PyObjectBase*) self)->isValid()){
        PyErr_SetString(PyExc_ReferenceError, "This object is already deleted most likely through closing a document. This reference is no longer valid!");
        return NULL;
    }

    try {
        return Py::new_reference_to(((ParabolaPy*)self)->getAxis());
    } catch (const Py::Exception&) {
        // The exception text is already set
        return NULL;
    } catch (...) {
        PyErr_SetString(PyExc_Exception, "Unknown exception while reading attribute 'Axis' of object 'GeomParabola'");
        return NULL;
    }
}

int ParabolaPy::staticCallback_setAxis (PyObject *self, PyObject *value, void * /*closure*/)
{    
    if (!((PyObjectBase*) self)->isValid()){
        PyErr_SetString(PyExc_ReferenceError, "This object is already deleted most likely through closing a document. This reference is no longer valid!");
        return -1;
    }
    if (((PyObjectBase*) self)->isConst()){
        PyErr_SetString(PyExc_ReferenceError, "This object is immutable, you can not set any attribute or call a method");
        return -1;
    }

    try {
        ((ParabolaPy*)self)->setAxis(Py::Object(value,false));
        return 0;
    } catch (const Py::Exception&) {
        // The exception text is already set
        return -1;
    } catch (...) {
        PyErr_SetString(PyExc_Exception, "Unknown exception while writing attribute 'Axis' of object 'GeomParabola'");
        return -1;
    }
}



//--------------------------------------------------------------------------
// Parents structure
//--------------------------------------------------------------------------
PyParentObject ParabolaPy::Parents[] = { PARENTSPartParabolaPy };

//--------------------------------------------------------------------------
// Constructor
//--------------------------------------------------------------------------
ParabolaPy::ParabolaPy(GeomParabola *pcObject, PyTypeObject *T)
    : GeometryCurvePy(reinterpret_cast<GeometryCurvePy::PointerType>(pcObject), T)
{
}


//--------------------------------------------------------------------------
// destructor
//--------------------------------------------------------------------------
ParabolaPy::~ParabolaPy()                                // Everything handled in parent
{
}

//--------------------------------------------------------------------------
// ParabolaPy representation
//--------------------------------------------------------------------------
PyObject *ParabolaPy::_repr(void)
{
    return Py_BuildValue("s", representation().c_str());
}

//--------------------------------------------------------------------------
// ParabolaPy Attributes
//--------------------------------------------------------------------------
PyObject *ParabolaPy::_getattr(char *attr)				// __getattr__ function: note only need to handle new state
{
    try {
        // getter method for special Attributes (e.g. dynamic ones)
        PyObject *r = getCustomAttributes(attr);
        if(r) return r;
    }
#ifndef DONT_CATCH_CXX_EXCEPTIONS 
    catch(const Base::Exception& e) // catch the FreeCAD exceptions
    {
        std::string str;
        str += "FreeCAD exception thrown (";
        str += e.what();
        str += ")";
        e.ReportException();
        PyErr_SetString(PyExc_Exception,str.c_str());
        return NULL;
    }
    catch(const std::exception& e) // catch other c++ exceptions
    {
        std::string str;
        str += "FC++ exception thrown (";
        str += e.what();
        str += ")";
        Base::Console().Error(str.c_str());
        PyErr_SetString(PyExc_Exception,str.c_str());
        return NULL;
    }
    catch(const Py::Exception&)
    {
        // The exception text is already set
        return NULL;
    }
    catch(...)  // catch the rest!
    {
        PyErr_SetString(PyExc_Exception,"Unknown C++ exception");
        return NULL;
    }
#else  // DONT_CATCH_CXX_EXCEPTIONS  
    catch(const Base::Exception& e) // catch the FreeCAD exceptions
    {
        std::string str;
        str += "FreeCAD exception thrown (";
        str += e.what();
        str += ")";
        e.ReportException();
        PyErr_SetString(PyExc_Exception,str.c_str());
        return NULL;
    }
    catch(const Py::Exception&)
    {
        // The exception text is already set
        return NULL;
    }
#endif  // DONT_CATCH_CXX_EXCEPTIONS

    PyObject *rvalue = Py_FindMethod(Methods, this, attr);
    if (rvalue == NULL)
    {
        PyErr_Clear();
        return GeometryCurvePy::_getattr(attr);
    }
    else
    {
        return rvalue;
    }
}

int ParabolaPy::_setattr(char *attr, PyObject *value) 	// __setattr__ function: note only need to handle new state
{
    try {
        // setter for  special Attributes (e.g. dynamic ones)
        int r = setCustomAttributes(attr, value);
        if(r==1) return 0;
    }
#ifndef DONT_CATCH_CXX_EXCEPTIONS 
    catch(const Base::Exception& e) // catch the FreeCAD exceptions
    {
        std::string str;
        str += "FreeCAD exception thrown (";
        str += e.what();
        str += ")";
        e.ReportException();
        PyErr_SetString(PyExc_Exception,str.c_str());
        return -1;
    }
    catch(const std::exception& e) // catch other c++ exceptions
    {
        std::string str;
        str += "FC++ exception thrown (";
        str += e.what();
        str += ")";
        Base::Console().Error(str.c_str());
        PyErr_SetString(PyExc_Exception,str.c_str());
        return -1;
    }
    catch(const Py::Exception&)
    {
        // The exception text is already set
        return -1;
    }
    catch(...)  // catch the rest!
    {
        PyErr_SetString(PyExc_Exception,"Unknown C++ exception");
        return -1;
    }
#else  // DONT_CATCH_CXX_EXCEPTIONS  
    catch(const Base::Exception& e) // catch the FreeCAD exceptions
    {
        std::string str;
        str += "FreeCAD exception thrown (";
        str += e.what();
        str += ")";
        e.ReportException();
        PyErr_SetString(PyExc_Exception,str.c_str());
        return -1;
    }
    catch(const Py::Exception&)
    {
        // The exception text is already set
        return -1;
    }
#endif  // DONT_CATCH_CXX_EXCEPTIONS

    return GeometryCurvePy::_setattr(attr, value);
}

GeomParabola *ParabolaPy::getGeomParabolaPtr(void) const
{
    return static_cast<GeomParabola *>(_pcTwinPointer);
}

#if 0
/* From here on come the methods you have to implement, but NOT in this module. Implement in ParabolaPyImp.cpp! This prototypes 
 * are just for convenience when you add a new method.
 */

PyObject *ParabolaPy::PyMake(struct _typeobject *, PyObject *, PyObject *)  // Python wrapper
{
    // create a new instance of ParabolaPy and the Twin object 
    return new ParabolaPy(new GeomParabola);
}

// constructor method
int ParabolaPy::PyInit(PyObject* /*args*/, PyObject* /*kwd*/)
{
    return 0;
}

// returns a string which represents the object e.g. when printed in python
std::string ParabolaPy::representation(void) const
{
    return std::string("<GeomParabola object>");
}

PyObject* ParabolaPy::compute(PyObject *args)
{
    PyErr_SetString(PyExc_NotImplementedError, "Not yet implemented");
    return 0;
}



Py::Float ParabolaPy::getEccentricity(void) const
{
    //return Py::Float();
    throw Py::AttributeError("Not yet implemented");
}

Py::Float ParabolaPy::getFocal(void) const
{
    //return Py::Float();
    throw Py::AttributeError("Not yet implemented");
}

void  ParabolaPy::setFocal(Py::Float arg)
{
    throw Py::AttributeError("Not yet implemented");
}

Py::Object ParabolaPy::getFocus(void) const
{
    //return Py::Object();
    throw Py::AttributeError("Not yet implemented");
}

Py::Float ParabolaPy::getParameter(void) const
{
    //return Py::Float();
    throw Py::AttributeError("Not yet implemented");
}

Py::Object ParabolaPy::getLocation(void) const
{
    //return Py::Object();
    throw Py::AttributeError("Not yet implemented");
}

void  ParabolaPy::setLocation(Py::Object arg)
{
    throw Py::AttributeError("Not yet implemented");
}

Py::Object ParabolaPy::getAxis(void) const
{
    //return Py::Object();
    throw Py::AttributeError("Not yet implemented");
}

void  ParabolaPy::setAxis(Py::Object arg)
{
    throw Py::AttributeError("Not yet implemented");
}

PyObject *ParabolaPy::getCustomAttributes(const char* attr) const
{
    return 0;
}

int ParabolaPy::setCustomAttributes(const char* attr, PyObject *obj)
{
    return 0; 
}
#endif



