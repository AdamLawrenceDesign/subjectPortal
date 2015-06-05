using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using ADVOnlineOrderBE;
using ADVOnlineOrderDA;
using ADVOnlineOrderMgt;
using System.Text;
using System.Net;
using System.Xml;
using au.com.ippayments.www;
//using au.com.ippayments.demo; //[1]
using System.Net.Mail;
using System.Web.SessionState;


public partial class _cart : System.Web.UI.Page
{
    dts ips = new au.com.ippayments.www.dts();
    //dts ipsdemo = new au.com.ippayments.demo.dts(); //[2]

    Xml xml = new Xml();
    WebOrders webOrders = new WebOrders();
    WebOrderItems webOrderItems = new WebOrderItems();
    WebOrdersDA webOrdersDA = new WebOrdersDA();
    WebOrderItemsDA webOrderItemsDA = new WebOrderItemsDA();
    InsertMgt inserMgt = new InsertMgt();
    SelectMgt selectMgt = new SelectMgt();
    WebCart.CartRow row = new WebCart.CartRow();
    WebCart.Cart myCart = new WebCart.Cart();
    DataTable dtCartTable = new DataTable();//(DataTable)ViewState["CartTable"];
    DataRow drCartRow = null;

    public WebCart.Cart GetCart() { return myCart; }

    public System.Collections.ArrayList cartList = new ArrayList(10);

    private const string URL_CART = "ShoppingCart.aspx";
    private const string URL_ERROR = "ErrorPage.aspx";
    private const string URL_TIMEOUT = "timeOut.aspx";
    private int vWebClientID;
    private int nTotalItem;
    private string pLogo = "Public-Logo";
    private string pBanner = "Public-Banner";
    private string pPortal = "AllowPublicPortal = 1";
    private string pFormat = "GroupAlbum";
    private string vSearchVal = "";
    private string vItemName = "Photographic Print";
    private int vID = 0;
    private int vPrimarySubjectID = 0;
    private string vClientID;
    private string encWebClientID;
    private string vCssStyle;
    private string vCName;
    private string vEvent;
    private string wEventId;
    private string vKeycode;
    private int voucherCnt = 0;
    private string productIDs = string.Empty;
    private double maxAmount = 0.00;
    private double nPrice = 0.00;
    private int nTotQty = 0;
    private double nTotDisc = 0.00;
    private double tempTotDiscount;
    private double tempTotDiscount2;
    private const string URL_HOME = "index.aspx?SIC=";
    private const string URL_DOWNLOAD = "downloads.aspx?SIC=";
    private const string URL_GROUP = "group_img.aspx?SIC=";
    private const string URL_GIFT = "gift_items.aspx?SIC=";
    private const string URL_PACKAGE = "packages.aspx?SIC=";
    private int cntProduct;
    private static string strPathAndQuery = HttpContext.Current.Request.Url.PathAndQuery;
    private static string strUrl = HttpContext.Current.Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");


    private void RemoveCache()
    {
        Response.Buffer = true;
        Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
        Response.Expires = 0;
        Response.CacheControl = "no-cache";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        /*Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();*/

    }

    /// <summary>
    /// Removes all sessions that were previously created.
    /// </summary>
    private void RemoveSession()
    {
        Session.RemoveAll();
        Session.Clear();
        Session.Abandon();

    }

    private void LoadCart()
    {
        if (Session["voucher"] != null)
        {
            this.voucherCode.Value = Session["voucher"].ToString();
            voucherCnt = selectMgt.GetCountVoucher(this.voucherCode.Value).Ctr;
            productIDs = selectMgt.GetVoucher(this.voucherCode.Value).ProductIDs;
            maxAmount = Convert.ToDouble(selectMgt.GetVoucher(this.voucherCode.Value).MaxAmount);
        }

        nTotalItem = myCart.list.Count;
        /*double nPrice = 0.00;
        int nTotQty = 0;
        double nTotDisc = 0.00;*/

        grvCart.DataSource = null;
        grvCart.DataBind();

        ViewState["TotItem"] = nTotalItem;
        ViewState["Name"] = string.Empty;

        if (nTotalItem == 0)
        {
            this.lblNoItem.Visible = true;

        }
        else
        {
            this.lblNoItem.Visible = false;

            dtCartTable.Columns.Add(new DataColumn("ID", typeof(string)));
            dtCartTable.Columns.Add(new DataColumn("WebClientAssetID", typeof(string)));
            dtCartTable.Columns.Add(new DataColumn("ProductID", typeof(string)));
            dtCartTable.Columns.Add(new DataColumn("Image", typeof(string)));
            dtCartTable.Columns.Add(new DataColumn("Quantity", typeof(string)));
            dtCartTable.Columns.Add(new DataColumn("Name", typeof(string)));
            dtCartTable.Columns.Add(new DataColumn("Description", typeof(string)));
            dtCartTable.Columns.Add(new DataColumn("Retail Price", typeof(string)));
            dtCartTable.Columns.Add(new DataColumn("Discount", typeof(string)));
            dtCartTable.Columns.Add(new DataColumn("Total", typeof(string)));

            for (int nItem = 0; nItem < nTotalItem; nItem++)
            {
                row = (WebCart.CartRow)myCart.list[nItem];

                //Discount 19/05/2015
                if (voucherCnt > 0)
                {
                    if (Convert.ToDouble(Session["TotalDiscount"]) < maxAmount || maxAmount == 0.00)
                    {
                        if (productIDs.Contains(row.prodId))
                        {
                            row.discount = Convert.ToDouble(selectMgt.GetVoucher(this.voucherCode.Value).DiscountAmount).ToString("n2");
                            row.total = (Convert.ToDouble(row.price) - Convert.ToDouble(row.discount)).ToString("n2");
                            row.tItems = row.items;
                            row.tDiscount = Convert.ToDouble(selectMgt.GetVoucher(this.voucherCode.Value).DiscountAmount).ToString("n2");
                            row.grandTotal = (Convert.ToDouble(row.price) - Convert.ToDouble(row.discount)).ToString("n2");

                            tempTotDiscount2 += Convert.ToDouble(selectMgt.GetVoucher(this.voucherCode.Value).DiscountAmount);

                            Session["TotalDiscount"] = tempTotDiscount2;
                        }
                    }
                }

                drCartRow = dtCartTable.NewRow();
                drCartRow["ID"] = nItem + 1;
                drCartRow["WebClientAssetID"] = row.webClientAssetId;
                drCartRow["ProductID"] = row.prodId;
                drCartRow["Image"] = row.imgUrl;
                drCartRow["Quantity"] = row.items;
                drCartRow["Name"] = row.groupName;
                drCartRow["Description"] = row.description;
                drCartRow["Retail Price"] = row.price;
                drCartRow["Discount"] = row.discount;
                drCartRow["Total"] = row.total;

                dtCartTable.Rows.Add(drCartRow);
                grvCart.DataSource = dtCartTable;
                grvCart.DataBind();

                ViewState["CartTable"] = dtCartTable;
                ViewState["Name"] = row.groupName;
                ViewState["Price"] = row.price;

                Session["ImgeURL"] = row.imgUrl;
                Session["Name"] = row.groupName;

                //nPrice += Convert.ToDouble(row.grandTotal);
                //nTotQty += Convert.ToInt32(row.tItems);
                nPrice += Convert.ToDouble(row.total);
                nTotQty += Convert.ToInt32(row.items);
                nTotDisc += Convert.ToDouble(row.discount);
            }

            //int cnt = 0;

            foreach (GridViewRow rowitem in grvCart.Rows)
            {
                //if (ViewState["Name"].ToString().Contains("PrePay"))
                Label lblName = (Label)rowitem.Cells[6].FindControl("lblName");

                if (lblName.Text.Contains("PrePay"))
                {
                    DropDownList drpQty = (DropDownList)rowitem.Cells[5].FindControl("drpQty");
                    drpQty.Enabled = false;
                }

                Label lblPrice = (Label)rowitem.Cells[8].FindControl("lblPrice");

                if (lblPrice.Text == "0.00")
                {
                    DropDownList drpQty = (DropDownList)rowitem.Cells[5].FindControl("drpQty");
                    drpQty.Enabled = false;
                }

                //Edit Validation 27/05/2015
                if (Session["EditURL"] != null)
                {
                    //if (cnt == 0)
                    //{
                    cntProduct = selectMgt.GetProductCount("Photocreate", Convert.ToInt32(row.prodId)).Ctr;
                    //}
                    /*else
                    {

                        cntProduct = selectMgt.GetProductCount("Photocreate", 60).Ctr;
                    }*/


                    if (cntProduct > 0)
                    {
                        Button btnEdit = (Button)rowitem.Cells[2].FindControl("btnEdit");

                        btnEdit.Visible = true;
                    }
                }
                else
                {
                    Button btnEdit = (Button)rowitem.Cells[2].FindControl("btnEdit");

                    btnEdit.Visible = false;
                }

                //cnt += 1;

            }

        }

        double HFee;

        //if (nTotQty.ToString() == "1" && nPrice.ToString("n2") == "0.00")
        if (nPrice.ToString("n2") == "0.00")
        {
            this.lblHandlingFee.Text = "0.00";
            HFee = 0.00;
        }
        else
        {
            this.lblHandlingFee.Text = "1.00";
            HFee = Convert.ToDouble(this.lblHandlingFee.Text);
        }

        /*lblTotAmt.Text = (nPrice + HFee + nTotDisc).ToString("n2");
        lblQty.Text = nTotQty.ToString();
        lblDiscount.Text = nTotDisc.ToString("n2");*/

        lblTotAmt.Text = (nPrice + HFee).ToString("n2");
        lblQty.Text = nTotQty.ToString();
        lblDiscount.Text = nTotDisc.ToString("n2");

        Session["HFee"] = HFee;
        Session["TotalDiscount"] = nTotDisc.ToString("n2");

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["keycode"] == null)
            {
                Response.Redirect("timeout.aspx");
            }
            else
            {
                //this.hSIC.Value = Session["keycode"].ToString();
                voucherCnt = selectMgt.GetCountVoucher(this.voucherCode.Value).Ctr;

                Session["CancelURL"] = HttpContext.Current.Request.RawUrl;

                /*if (Session["userId"] != null)
                {
                    this.hUserId.Value = Session["userId"].ToString();
                }*/

                if (Session["voucher"] != null)
                {
                    this.voucherCode.Value = Session["voucher"].ToString();
                }

                //this.lblHandlingFee.Text = "1.00";

                if ((Session["advancedyou_cart"] == null))
                {
                    Session["advancedyou_cart"] = myCart;

                }
                else
                {
                    myCart = (WebCart.Cart)(Session["advancedyou_cart"]);

                    int nTotalItem = myCart.list.Count;
                    double nPrice = 0.00;
                    int nTotQty = 0;
                    double nTotDisc = 0.00;

                    for (int nItem = 0; nItem < nTotalItem; nItem++)
                    {
                        row = (WebCart.CartRow)myCart.list[nItem];

                        nPrice += Convert.ToDouble(row.grandTotal);
                        nTotQty += Convert.ToInt32(row.tItems);
                        nTotDisc += Convert.ToDouble(row.tDiscount);
                    }

                    lblTotAmt.Text = nPrice.ToString("n2");
                    lblQty.Text = nTotQty.ToString();
                    lblDiscount.Text = nTotDisc.ToString("n2");

                }

                vKeycode = Session["keycode"].ToString();
                vClientID = selectMgt.GetSubjectInfo(vKeycode).ClientID.ToString();
                vID = selectMgt.GetSubjectInfo(vKeycode).ID;
                vPrimarySubjectID = selectMgt.GetSubjectInfo(vKeycode).PrimarySubjectID;

                vWebClientID = Convert.ToInt32(selectMgt.GetWebClientByClientID(Convert.ToInt32(vClientID)).WebClientID);
                encWebClientID = SecurityMgt.Encrypt("WebClientID=" + vWebClientID, true);

                ViewState["encWebClientid"] = encWebClientID;
                ViewState["webClientId"] = vWebClientID;

                string vClientlnk = string.Empty;

                ArrayList rec = (ArrayList)selectMgt.GetLinkWebClient(vWebClientID);

                foreach (LinkClient lnkClient in rec)
                {
                    if (vClientlnk == string.Empty)
                    {
                        vClientlnk = "WebClientID = " + lnkClient.WebClientID.ToString();
                    }
                    else
                    {
                        vClientlnk = vClientlnk + " or WebClientID = " + lnkClient.WebClientID.ToString();
                    }
                }


                if (ViewState["webClientId"] != null)
                {
                    vWebClientID = Convert.ToInt32(ViewState["webClientId"]);
                }
                else
                {
                    ViewState["webClientId"] = vWebClientID;
                    ViewState["encWebClientid"] = encWebClientID;
                }


                if (vWebClientID.ToString() != string.Empty && vWebClientID != 0)
                {
                    try
                    {

                        vCName = selectMgt.GetWebClientRowById(vWebClientID).WebName.ToString().ToUpper();

                        HtmlControl pageTitle = (HtmlControl)FindControl("pageTitle");
                        if (pageTitle != null)
                        {
                            Page.Title = vCName + " | advancedLife photography Shopping Cart";
                        }

                        try
                        {
                            vClientID = Convert.ToString(selectMgt.GetClientSearchTag(Convert.ToInt32(vWebClientID), pLogo, pPortal).ClientID);
                        }
                        catch
                        {
                            vClientID = "0";
                        }


                        HtmlControl iconTitle = (HtmlControl)FindControl("iconTitle");
                        if (iconTitle != null)
                        {
                            if (vClientID != "0")
                            {
                                string vSubFolder = selectMgt.GetClientSearchTag(Convert.ToInt32(vWebClientID), pLogo, pPortal).SubFolder;
                                string vLogoName = selectMgt.GetClientSearchTag(Convert.ToInt32(vWebClientID), pLogo, pPortal).ThumbnailFileName;
                                string ImgPath = "~/lifebuyimages/" + vClientID + "/" + vSubFolder + "/" + vLogoName;

                                iconTitle.Attributes["href"] = ResolveUrl(ImgPath);
                            }
                        }

                        //Client Information
                        vCssStyle = selectMgt.GetWebClientRowById(Convert.ToInt32(vWebClientID)).CSSstyle; //WebCSSStyle

                        if (vCssStyle == string.Empty)
                        {
                            hSchoolData.Value = "{ClientID:'" + selectMgt.GetWebClientRowById(vWebClientID).ClientID.ToString().ToUpper().Replace("'", "?") + "'" +
                                                 ",WebName:'" + selectMgt.GetWebClientRowById(vWebClientID).WebName.ToString().ToUpper().Replace("'", "?") + "'" +
                                                 ",WebAddress:'" + selectMgt.GetWebClientRowById(vWebClientID).WebAddress.ToString().ToUpper().Replace("'", "?") + "'" +
                                                 ",WebTown:'" + selectMgt.GetWebClientRowById(vWebClientID).WebTown.ToString().ToUpper().Replace("'", "?") + " " + selectMgt.GetWebClientRowById(vWebClientID).WebState.ToString().ToUpper().Replace("'", "?") + " " + selectMgt.GetWebClientRowById(vWebClientID).WebPostCode.ToString().ToUpper().Replace("'", "?") + "'" +
                                                 ",Principal:'" + selectMgt.GetWebClientRowById(vWebClientID).Principal.ToString().ToUpper().Replace("'", "?") + "'" +
                                                 ",CssStyle:'ubl'}";
                        }
                        else
                        {
                            hSchoolData.Value = "{ClientID:'" + selectMgt.GetWebClientRowById(vWebClientID).ClientID.ToString().ToUpper().Replace("'", "?") + "'" +
                                                 ",WebName:'" + selectMgt.GetWebClientRowById(vWebClientID).WebName.ToString().ToUpper().Replace("'", "?") + "'" +
                                                 ",WebAddress:'" + selectMgt.GetWebClientRowById(vWebClientID).WebAddress.ToString().ToUpper().Replace("'", "?") + "'" +
                                                 ",WebTown:'" + selectMgt.GetWebClientRowById(vWebClientID).WebTown.ToString().ToUpper().Replace("'", "?") + " " + selectMgt.GetWebClientRowById(vWebClientID).WebState.ToString().ToUpper().Replace("'", "?") + " " + selectMgt.GetWebClientRowById(vWebClientID).WebPostCode.ToString().ToUpper().Replace("'", "?") + "'" +
                                                 ",Principal:'" + selectMgt.GetWebClientRowById(vWebClientID).Principal.ToString().ToUpper().Replace("'", "?") + "'" +
                                                 ",CssStyle:'" + vCssStyle.ToLower().Replace("'", "?") + "'}";
                        }


                        //Subject Latest Image
                        int piCtr = 0;
                        ArrayList data1 = (ArrayList)selectMgt.GetFirstSubject(vID, vPrimarySubjectID);

                        foreach (SubjectPackage subjectPackage in data1)
                        {
                            if (data1.Count - 1 == piCtr)
                            {
                                hFirstImgPortrait.Value += "{'Id':'" + subjectPackage.ID + "','EventID':'" + subjectPackage.EventID + "'" + ",'LastName':'" + subjectPackage.LastName.Replace("'", "?") + "'" + ",'FirstName':'" + subjectPackage.FirstName.Replace("'", "?") + "'" + ",'DateOfBirth':'" + subjectPackage.DateOfBirth.ToString().Replace("1/01/0001 12:00:00 AM", "").Replace("/", @"\") + "'" + ",'SubjectFolder':'" + subjectPackage.SubjectFolder.Replace("'", "?") + "'" + ",'Folder':'" + subjectPackage.Folder.Replace("'", "?") + "'" +
                                               ",'NonBuy':'" + subjectPackage.NonBuy + "'" + ",'ImageIsPortrait':'" + subjectPackage.ImageIsPortrait + "'" + ",'DstImage':'" + subjectPackage.DstImage.Replace(@"\", "/") + "'" + ",'Package':'" + subjectPackage.Package.Replace("'", "?") + "'" + ",'SIC':'" + subjectPackage.SIC + "'" + ",'CostCode':'" + subjectPackage.CostCode + "'" +
                                               ",'PrimarySubjectID':'" + subjectPackage.PrimarySubjectID + "'" + ",'NumImages':'" + subjectPackage.NumImages + "'" + ",'BookName':'" + subjectPackage.BookName.Replace("'", "?") + "'" + ",'ClientID':'" + subjectPackage.ClientID + "'" + ",'HubId':'" + subjectPackage.HubID + "'" + ",'YearPhoto':'" + subjectPackage.YearPhoto + "'" + ",'HasImage':'" + subjectPackage.HasImage + "'" +
                                               ",'SchYr':'" + subjectPackage.SchYr + "'" + ",'EnrolmentYear':'" + subjectPackage.EnrolmentYear + "'" + ",'GroupType':'" + subjectPackage.GroupType.Replace("'", "?") + "'" + ",'BlockSubjectPortal':'" + subjectPackage.BlockSubjectPortal + "'}";
                            }
                            else
                            {
                                hFirstImgPortrait.Value += "{'Id':'" + subjectPackage.ID + "','EventID':'" + subjectPackage.EventID + "'" + ",'LastName':'" + subjectPackage.LastName.Replace("'", "?") + "'" + ",'FirstName':'" + subjectPackage.FirstName.Replace("'", "?") + "'" + ",'DateOfBirth':'" + subjectPackage.DateOfBirth.ToString().Replace("1/01/0001 12:00:00 AM", "").Replace("/", @"\") + "'" + ",'SubjectFolder':'" + subjectPackage.SubjectFolder.Replace("'", "?") + "'" + ",'Folder':'" + subjectPackage.Folder.Replace("'", "?") + "'" +
                                               ",'NonBuy':'" + subjectPackage.NonBuy + "'" + ",'ImageIsPortrait':'" + subjectPackage.ImageIsPortrait + "'" + ",'DstImage':'" + subjectPackage.DstImage.Replace(@"\", "/") + "'" + ",'Package':'" + subjectPackage.Package.Replace("'", "?") + "'" + ",'SIC':'" + subjectPackage.SIC + "'" + ",'CostCode':'" + subjectPackage.CostCode + "'" +
                                               ",'PrimarySubjectID':'" + subjectPackage.PrimarySubjectID + "'" + ",'NumImages':'" + subjectPackage.NumImages + "'" + ",'BookName':'" + subjectPackage.BookName.Replace("'", "?") + "'" + ",'ClientID':'" + subjectPackage.ClientID + "'" + ",'HubId':'" + subjectPackage.HubID + "'" + ",'YearPhoto':'" + subjectPackage.YearPhoto + "'" + ",'HasImage':'" + subjectPackage.HasImage + "'" +
                                               ",'SchYr':'" + subjectPackage.SchYr + "'" + ",'EnrolmentYear':'" + subjectPackage.EnrolmentYear + "'" + ",'GroupType':'" + subjectPackage.GroupType.Replace("'", "?") + "'" + ",'BlockSubjectPortal':'" + subjectPackage.BlockSubjectPortal + "'},";
                            }

                            piCtr = piCtr + 1;

                        }

                        //Group Latest Image
                        vSearchVal = selectMgt.GetSubjectInfo(vKeycode).FirstName.Replace("(", "").Replace(")", "") + " " + selectMgt.GetSubjectInfo(vKeycode).LastName.Replace("(", "").Replace(")", "");

                        if (vSearchVal.Contains(" "))
                        {
                            vSearchVal = vSearchVal.Replace(" ", "%");
                        }
                        else if (vSearchVal.Contains("."))
                        {
                            vSearchVal = vSearchVal.Replace(".", "%");
                        }
                        else if (vSearchVal.Contains("'"))
                        {
                            vSearchVal = vSearchVal.Replace("'", "''");
                        }

                        ArrayList data2 = (ArrayList)selectMgt.GetFirstSearchList(vClientlnk, pFormat, pPortal, vSearchVal, vItemName);

                        int gCtr = 0;
                        foreach (SearchAssets scAssets in data2)
                        {
                            if (data2.Count - 1 == gCtr)
                            {
                                hFirstImgGroup.Value += "{'webClientAssetID':" + "'" + scAssets.WebClientAssetID + "','ClientID':'" + scAssets.ClientID + "'" + ",'SubFolder':'" + scAssets.SubFolder.Replace(@"\", "/") + "'" + ",'fileName':'" + scAssets.ThumbnailFileName + "'" + ",'ProductID':'" + scAssets.ProductGroupName.Replace("'", "?") + "'" + ",'searchTag1':'" + scAssets.SearchList.Replace("'", "?") + "'" + ",'dateOfPhotography':'" + scAssets.PhotoDay.ToString().Replace("1/01/0001 12:00:00 AM", "").Replace(@"\", "/") + "'" + ",'unitPrice':'" + scAssets.UnitPrice.ToString("n2") + "'" +
                                                    ",'Description':'" + scAssets.ProductGroupName.Replace("'", "?") + "'" + ",'webName':'" + selectMgt.GetWebClientRowById(vWebClientID).WebName.ToString().ToUpper().Replace("'", "?") + "'}";
                            }
                            else
                            {
                                hFirstImgGroup.Value += "{'webClientAssetID':" + "'" + scAssets.WebClientAssetID + "','ClientID':'" + scAssets.ClientID + "'" + ",'SubFolder':'" + scAssets.SubFolder.Replace(@"\", "/") + "'" + ",'fileName':'" + scAssets.ThumbnailFileName + "'" + ",'ProductID':'" + scAssets.ProductGroupName.Replace("'", "?") + "'" + ",'searchTag1':'" + scAssets.SearchList.Replace("'", "?") + "'" + ",'dateOfPhotography':'" + scAssets.PhotoDay.ToString().Replace("1/01/0001 12:00:00 AM", "").Replace(@"\", "/") + "'" + ",'unitPrice':'" + scAssets.UnitPrice.ToString("n2") + "'" +
                                                    ",'Description':'" + scAssets.ProductGroupName.Replace("'", "?") + "'" + ",'webName':'" + selectMgt.GetWebClientRowById(vWebClientID).WebName.ToString().ToUpper().Replace("'", "?") + "'},";
                            }

                            gCtr = gCtr + 1;

                        }

                        //Banner
                        int sCtr = 0;
                        ArrayList data3 = (ArrayList)selectMgt.GetHtmlTags(vWebClientID, pBanner, pPortal);

                        foreach (WebClientHtmlTag wcAssets in data3)
                        {

                            if (data3.Count == sCtr)
                            {
                                hBannerImages.Value = "{" + sCtr + ":'" + wcAssets.ThumbnailFileName + "'";
                            }
                            else
                            {
                                hBannerImages.Value = hBannerImages.Value + sCtr + ":'" + wcAssets.ThumbnailFileName + "',";
                            }

                            sCtr = sCtr + 1;

                        }

                        if (sCtr == 0)
                        {
                            hBannerImages.Value = "{" + string.Empty + "}";
                        }
                        else
                        {
                            hBannerImages.Value = "{" + hBannerImages.Value.Substring(0, hBannerImages.Value.Length - 1) + "}";
                        }

                        //Top Links
                        HtmlControl home = (HtmlControl)FindControl("home");
                        if (home != null)
                        {
                            home.Attributes["href"] = ResolveUrl(URL_HOME + vKeycode);
                        }

                        HtmlControl download = (HtmlControl)FindControl("download");
                        if (download != null)
                        {
                            download.Attributes["href"] = ResolveUrl(URL_DOWNLOAD + vKeycode);
                        }

                        HtmlControl group = (HtmlControl)FindControl("group");
                        if (group != null)
                        {
                            group.Attributes["href"] = ResolveUrl(URL_GROUP + vKeycode);
                        }

                        HtmlControl gift = (HtmlControl)FindControl("gift");
                        if (gift != null)
                        {
                            gift.Attributes["href"] = ResolveUrl(URL_GIFT + vKeycode);
                        }

                        HtmlControl package = (HtmlControl)FindControl("package");
                        if (package != null)
                        {
                            package.Attributes["href"] = ResolveUrl(URL_PACKAGE + vKeycode);
                        }


                        HtmlControl schoolLogo1 = (HtmlControl)FindControl("schoolLogo1");
                        if (schoolLogo1 != null)
                        {
                            if (vClientID != "0")
                            {
                                string vSubFolder = selectMgt.GetClientSearchTag(Convert.ToInt32(vWebClientID), pLogo, pPortal).SubFolder;
                                string vLogoName = selectMgt.GetClientSearchTag(Convert.ToInt32(vWebClientID), pLogo, pPortal).ThumbnailFileName;
                                string ImgPath = "~/lifebuyimages/" + vClientID + "/" + vSubFolder + "/" + vLogoName;

                                schoolLogo1.Attributes["src"] = ResolveUrl(ImgPath);
                            }
                        }

                        HtmlGenericControl clientName = (HtmlGenericControl)FindControl("clientName");
                        if (clientName != null)
                        {
                            clientName.InnerText = vCName;
                        }

                        HtmlGenericControl address1 = (HtmlGenericControl)FindControl("address1");
                        if (address1 != null)
                        {
                            address1.InnerText = selectMgt.GetWebClientRowById(vWebClientID).WebAddress.ToString().ToUpper();
                        }

                        HtmlGenericControl address2 = (HtmlGenericControl)FindControl("address2");
                        if (address2 != null)
                        {
                            address2.InnerText = selectMgt.GetWebClientRowById(vWebClientID).WebTown.ToString().ToUpper() + " " + selectMgt.GetWebClientRowById(vWebClientID).WebState.ToString().ToUpper() + " " + selectMgt.GetWebClientRowById(vWebClientID).WebPostCode.ToString().ToUpper();
                        }

                        HtmlGenericControl principal = (HtmlGenericControl)FindControl("principal");
                        if (principal != null)
                        {
                            principal.InnerText = "Principal: " + selectMgt.GetWebClientRowById(vWebClientID).Principal.ToString().ToUpper();
                        }

                        //Cart
                        LoadCart();

                        if (ViewState["Name"].ToString().Contains("Event"))
                        {

                            wEventId = Session["EventID"].ToString();
                        }

                        Session["Name"] = ViewState["Name"].ToString();

                    }
                    catch
                    {
                        if (Session.IsNewSession == true)
                        {
                            Response.Redirect(URL_TIMEOUT, false);
                        }
                        else
                        {
                            Response.Redirect(URL_ERROR, false);
                        }
                    }
                }
            }
        }
    }

    protected void grvCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            if (Session.IsNewSession == true)
            {
                Response.Redirect(URL_TIMEOUT, false);
            }
            else
            {
                myCart = (WebCart.Cart)(Session["advancedyou_cart"]);
                myCart.list.RemoveAt(e.RowIndex);
                Session["advancedyou_cart"] = myCart;
                LoadCart();
            }
        }
        catch
        {
            Response.Redirect(URL_ERROR, false);
        }
    }

    protected void grvCart_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            if (Session.IsNewSession == true)
            {
                Response.Redirect(URL_TIMEOUT, false);
            }
            else
            {
                grvCart.EditIndex = e.NewEditIndex;
                LoadCart();
            }
        }
        catch
        {
            Response.Redirect(URL_ERROR, false);
        }
    }

    protected void grvCart_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "deleterow")
        {
            try
            {
                if (Session.IsNewSession == true)
                {
                    Response.Redirect(URL_TIMEOUT, false);
                }
                else
                {
                    tempTotDiscount = Convert.ToDouble(Session["TotalDiscount"]);
                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    myCart = (WebCart.Cart)(Session["advancedyou_cart"]);
                    row = (WebCart.CartRow)myCart.list[rowIndex];
                    myCart.list.RemoveAt(rowIndex);
                    Session["advancedyou_cart"] = myCart;

                    double totalDiscount = tempTotDiscount - Convert.ToDouble(row.discount);
                    Session["TotalDiscount"] = totalDiscount.ToString("n2");

                    LoadCart();
                }
            }
            catch
            {
                Response.Redirect(URL_ERROR, false);
            }
        }
        else if (e.CommandName == "editrow")
        {
            try
            {
                if (Session.IsNewSession == true)
                {
                    Response.Redirect(URL_TIMEOUT, false);
                }
                else
                {
                    Response.Redirect(strUrl + Session["EditURL"].ToString(), false);
                }
            }
            catch
            {
                Response.Redirect(URL_ERROR, false);
            }
        }
    }

    protected void grvCart_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            if (Session.IsNewSession == true)
            {
                Response.Redirect(URL_TIMEOUT, false);
            }
            else
            {
                grvCart.PageIndex = e.NewPageIndex;
                grvCart.DataSource = dtCartTable;
                grvCart.DataBind();
            }
        }
        catch
        {
            Response.Redirect(URL_ERROR, false);
        }
    }

    protected void drpQty_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (Session.IsNewSession == true)
            {
                Response.Redirect(URL_TIMEOUT, false);
            }
            else
            {
                DropDownList ddl = (DropDownList)sender;
                GridViewRow gvRow = (GridViewRow)ddl.Parent.Parent;
                int idx = gvRow.RowIndex;

                DropDownList drpQty = (DropDownList)grvCart.Rows[idx].FindControl("drpQty");
                Label lblPrice = (Label)grvCart.Rows[idx].FindControl("lblPrice");
                Label lblDiscount = (Label)grvCart.Rows[idx].FindControl("lblDiscount");

                string tQty = drpQty.Text;
                string tPrice = lblPrice.Text;
                string tDiscount = lblDiscount.Text;
                double tTotal = (Convert.ToDouble(tPrice) - Convert.ToDouble(tDiscount)) * Convert.ToInt32(tQty);
                int tTitems = Convert.ToInt32(row.tItems) + Convert.ToInt32(tQty);
                double tGtotal = Convert.ToDouble(row.grandTotal) + tTotal;

                myCart = (WebCart.Cart)(Session["advancedyou_cart"]);
                row = (WebCart.CartRow)myCart.list[idx];

                row.items = tQty;
                row.total = tTotal.ToString("n2");
                row.tItems = tTitems.ToString();
                row.grandTotal = tGtotal.ToString("n2");

                Session["advancedyou_cart"] = myCart;

                grvCart.EditIndex = -1;
                LoadCart();
            }
        }
        catch
        {
            Response.Redirect(URL_ERROR, false);
        }
    }


    protected void btnChkOut_Click(object sender, EventArgs e)
    {
        try
        {
            if (Session.IsNewSession == true)
            {
                Response.Redirect(URL_TIMEOUT, false);
            }
            else
            {
                int totItem = Convert.ToInt32(ViewState["TotItem"]);
                encWebClientID = Convert.ToString(ViewState["encWebClientid"]);

                if (totItem == 0)
                {
                    lblNoItem.Visible = true;
                    //MsgCart.InnerHtml = "<p class='txt_red'>You have no items in your cart.</p>";
                }
                else
                {
                    //Updated 2/04/2015
                    //int totAmt = Convert.ToInt32(lblTotAmt.Text.Replace(".00", ""));

                    decimal decTotAmt = Convert.ToDecimal(lblTotAmt.Text);
                    int totAmt = Convert.ToInt32(decTotAmt);

                    if (totAmt < 4 && lblHandlingFee.Text != "0.00")
                    {
                        lblNoItem.Visible = true;
                        MsgCart.InnerHtml = "<p class='txt_red'>Cart contains less than the minimum required amount!</p>";

                        this.btnChkOut.Enabled = false;
                    }
                    else
                    {
                        lblNoItem.Visible = false;
                        this.btnChkOut.Enabled = true;

                        vWebClientID = Convert.ToInt32(ViewState["webClientId"]);

                        if (lblHandlingFee.Text == "0.00")
                        {
                            //Response.Redirect("payment_nil.aspx?" + encWebClientID, false);
                            Response.Redirect("payment_nil.aspx?SIC=" + Session["keycode"] + "&userId=" + Session["userId"].ToString(), false);
                        }
                        else
                        {
                            //Response.Redirect("payment.aspx?WebClientID=" + vWebClientID, false);
                            //Response.Redirect("payment.aspx?" + encWebClientID, false);
                            Response.Redirect("payment.aspx?SIC=" + Session["keycode"] + "&userId=" + Session["userId"].ToString(), false);
                        }
                    }
                }
            }
        }
        catch
        {
            Response.Redirect(URL_ERROR, false);
        }
    }
    protected void btnContShop_Click(object sender, EventArgs e)
    {
        try
        {
           if (Session.IsNewSession == true)
            {
                Response.Redirect(URL_TIMEOUT, false);
            }
            else
            {

                vWebClientID = Convert.ToInt32(ViewState["webClientId"]);
                encWebClientID = Convert.ToString(ViewState["encWebClientid"]);

                //Response.Redirect("group_img.aspx?" + encWebClientID, false);
                Response.Redirect(Session["ContURL"].ToString(), false);
            }
        }
        catch
        {
            Response.Redirect(URL_ERROR, false);
        }
    }

    protected void updateBtn_Click(object sender, EventArgs e)
    {
        voucherCnt = selectMgt.GetCountVoucher(this.voucherCode.Value).Ctr;

        if (Session["voucher"] == null)
        {
            if (voucherCnt > 0)
            {
                this.lblHandlingFee.Text = "1.00";

                if (Session["advancedyou_cart"] == null)
                {
                    Session["advancedyou_cart"] = myCart;
                }
                else
                {
                    myCart = (WebCart.Cart)(Session["advancedyou_cart"]);
                }

                Session["voucher"] = this.voucherCode.Value;

                LoadCart();
            }
        }
        else
        {
            if (this.voucherCode.Value != Session["voucher"].ToString())
            {
                if (voucherCnt > 0)
                {
                    this.lblHandlingFee.Text = "1.00";

                    if (Session["advancedyou_cart"] == null)
                    {
                        Session["advancedyou_cart"] = myCart;
                    }
                    else
                    {
                        myCart = (WebCart.Cart)(Session["advancedyou_cart"]);
                    }

                    LoadCart();
                    Session["voucher"] = this.voucherCode.Value;
                }
            }
        }
    }  
}
