<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        @if(Auth::User()->role_id == '1')
            <ul class="nav" id="side-menu">
                <li>
                    <a href="{{url('/dashboard')}}"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Laporan<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="{{ url('/byitem')}}">Laporan Pembelian</a>
                            </li>
                        <li>
                            <a href="{{url('/bystore')}}">Laporan Flow Sales</a>
                        </li>
                        <li>
                            <a href="{{url('/bycategory')}}">Penjualan per kategori</a>
                        </li>
                        <li>
                            <a href="{{url('/byemployee')}}">Penjualan oleh karyawan</a>
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>

                <li>
                        <a href="#"><i class="fa fa-cart-arrow-down"></i> Shipment<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="{{url('/order')}}">Shipment Order</a>
                            </li>
                        </ul>
                </li>
                <li>
                        <a href="#"><i class="fa fa-cart-arrow-down"></i> Barang<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="daftaritem">Daftar item</a>
                            </li>
                            <li>
                                <a href="kategori">Kategori</a>
                            </li>
                            <li>
                                <a href="modifier">Pengubah</a>
                            </li>
                            <li>
                                <a href="diskon">Diskon</a>
                            </li>
                            <li>
                                <a href="{{url('/slider')}}">Slider</a>
                            </li>
                        </ul>
                </li>
                <li>
                        <a href="#"><i class="fa fa-cubes"></i> Iventory Management<span class="fa arrow"></span></a>
                    
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="{{url('/bypurchaseorder')}}">Purchase orders</a>
                            </li>
                            <li>
                                <a href="{{url('/bytransferorder')}}">Transfer orders</a>
                            </li>
                            <li>
                                <a href="{{url('/bystockadjustment')}}">Stock adjustments</a>
                            </li>
                            <li>
                                <a href="{{url('/bysupplier')}}">Suppliers</a>
                            </li>
                            <li>
                                <a href="{{url('/byinventoryhistory')}}">Inventory history</a>
                            </li>
                            <li>
                                <a href="{{url('/byinventoryvaluation')}}">Inventory valuation</a>
                            </li>
                        </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                        <a href="#"><i class="fa fa-group"></i> Admin<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="{{url('/bywaneehistory')}}">View Wanee</a>
                            </li>
                            
                            <li>
                                <a href="{{url('/bywaneepending')}}">Wanee Pending</a>
                            </li>
                            <li>
                                <a href="{{url('/bywaneeapprove')}}">Wanee Approved</a>
                            </li>
                            <p>-----------------------------------------------------------</p>
                            </li>
                            <li>
                                <a href="{{url('/byagent')}}">Verifikasi Agen</a>
                            </li>
                            <li>
                                <a href="{{url('/bywithdraw')}}">Withdraw</a>
                            </li>
                        
                
                        </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                        <a href="#"><i class="fa fa-cubes"></i> Vouchers<span class="fa arrow"></span></a>
                    
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="{{url('/voucher')}}">Voucher</a>
                            </li>
                        </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                        <a href="#"><i class="fa fa-male"></i> Pelanggan<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="flot.html">Basis Pelanggan</a>
                            </li>
                            <li>
                                <a href="morris.html">Notifikasi</a>
                            </li>
                        </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                        <a href="#"><i class="fa fa-group"></i> Supply<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="{{url('/bysupply')}}">Supply Sales</a>
                            </li>
                        </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                        <a href="#"><i class="fa fa-gears"></i> Pengaturan<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="flot.html">Umum</a>
                            </li>
                            <li>
                                <a href="morris.html">Jenis Pembayaran</a>
                            </li>
                            <li>
                                <a href="morris.html">Loyalitas</a>
                            </li>
                            <li>
                                <a href="morris.html">Pajak</a>
                            </li>
                            <li>
                                <a href="morris.html">Butki transaksi</a>
                            </li>
                            <li>
                                <a href="morris.html">Perangkat POS</a>
                            </li>
                        </ul>
                    <!-- /.nav-second-level -->
                </li>
            </ul>
        @elseif(Auth::User()->role_id == '8')
            <ul class="nav" id="side-menu">
                <li>
                    <a href="{{url('/dashboard')}}"><i class="fa fa-dashboard fa-fw"></i> Admin DashBoard</a>
                </li>
                <li>
                <a href="#"><i class="fa fa-cart-arrow-down"></i> Barang<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="daftaritem">Daftar item</a>
                    </li>
                    <li>
                        <a href="kategori">Kategori</a>
                    </li>
                    <li>
                        <a href="modifier">Pengubah</a>
                    </li>
                    <li>
                        <a href="diskon">Diskon</a>
                    </li>
                    <li>
                        <a href="{{url('/slider')}}">Slider</a>
                    </li>
                </ul>
                </li>
            </ul>
         @elseif(Auth::User()->role_id == '3')
            <ul class="nav" id="side-menu">
                <li>
                    <a href="{{url('/dashboard')}}"><i class="fa fa-dashboard fa-fw"></i> Admin DashBoard</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Laporan<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="{{url('/byitem')}}">Laporan Total sales</a>
                            </li>
                        <li>
                            <a href="{{url('/bystore')}}">Laporan Flow Sales</a>
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>

                <li>
                        <a href="#"><i class="fa fa-group"></i> Admin<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="{{url('/bywithdraw')}}">Withdraw</a>
                            </li>
                        </ul>
                    <!-- /.nav-second-level -->
                </li>
            </ul>
        @elseif(Auth::User()->role_id == '4')
            <ul class="nav" id="side-menu">
                <li>
                    <a href="{{url('/dashboard')}}"><i class="fa fa-dashboard fa-fw"></i> DashBoard</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Laporan<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="{{url('/byitem')}}">Laporan Total sales</a>
                            </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                        <a href="#"><i class="fa fa-cubes"></i> Iventory Management<span class="fa arrow"></span></a>
                    
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="{{url('/bystockadjustment')}}">Stock adjustments</a>
                            </li>
                        </ul>
                    <!-- /.nav-second-level -->
                </li>
            </ul>
        @endif
    </div> <!-- /.sidebar-collapse -->
</div> <!-- /.navbar-static-side -->
