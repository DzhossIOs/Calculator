// The MIT License (MIT) - Copyright (c) 2016 Carlos Vidal
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#if !(os(iOS) || os(tvOS))

    import AppKit

    /**
         DimensionAttribute extension adding some convenience methods to operate with
         `NSViews`
     */
    public extension DimensionAttribute {
        /**
            Establishes a relationship between the dimension attribute
            applied to the `NSView` and the reference `NSView` passed as
            parameter.

            It's also possible to link this relationship to a particular
            attribute of the `view` parameter by supplying `attribute`.

            - parameter view: The reference view
            - parameter attribute: The attribute of `view` we are establishing the
            relationship to
            - returns: The current `Attribute` instance
         */
        func like(_ view: NSView, _ attribute: ReferenceAttribute? = nil) -> Self {
            referenceItem = view
            referenceAttribute = attribute
            return self
        }

        /**
            Establishes a relationship between the dimension attribute
            applied to the `NSView` and the reference `NSLayoutGuide`
            passed as parameter.

            It's also possible to link this relationship to a particular
            attribute of the `layoutGuide` parameter by supplying `attribute`.

            - parameter layoutGuide: The reference `NSLayoutGuide`
            - parameter attribute: The attribute of `layoutGuide` we are  establishing
            the relationship to
            - returns: The current `Attribute` instance
         */
        @available(OSX 10.11, *)
        func like(_ layoutGuide: NSLayoutGuide, _ attribute: ReferenceAttribute? = nil) -> Self {
            referenceItem = layoutGuide
            referenceAttribute = attribute
            return self
        }
    }

    /**
         Size extension adding some convenience methods to let this  CompoundAttribute
         operate with `NSViews`
     */
    public extension Size {
        /**
            Establishes a relationship between the dimension attribute
            applied to the `NSView` and the reference `NSView` passed as
            parameter.
            - parameter view: The reference view
            - returns: The current `CompoundAttribute` instance
         */
        func like(_ view: NSView) -> Self {
            referenceItem = view
            for attr in attributes {
                attr.referenceItem = view
            }
            return self
        }

        /**
            Establishes a relationship between the dimension attribute
            applied to the `NSView` and the reference `NSLayoutGuide`
            passed as parameter.
            - parameter layoutGuide: The reference `NSLayoutGuide`
            - returns: The current `CompoundAttribute` instance
         */
        @available(OSX 10.11, *)
        func like(_ layoutGuide: NSLayoutGuide) -> Self {
            referenceItem = layoutGuide
            for attr in attributes {
                attr.referenceItem = layoutGuide
            }
            return self
        }
    }

#endif
