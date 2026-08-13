Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93135171B1;
	Thu, 13 Aug 2026 00:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786579479; cv=none; b=dyg0Mt+6HI08sTECBdPQu/xOBhyuG/w8xiUxgclZMQvPTucjVSOKTS/PRDect3dlMGEeSN4czmc+6tTtQ6UuzwWtLcxzK+Z4/GBG80HZvZ4ZjA8VT/OlH198EO7ksg9ZCdJ0lmFn5rNBkrzGIucaUrRsu95O4w1aS06Ynb1nugY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786579479; c=relaxed/simple;
	bh=nr+E4CnY8LhhsHNCnEcG2cigf3qNGBMZimVtRKnf/cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BepNG0p6nW9Wmb6Zwi83Dl+JWUeDAvaZdOx8xszxYBo1iFYjpQ92+mebTlgpzq2yUoDpsHy3MiVsxGtUdWQIo+03e30Q0Q/zH250oZTa7ujA2bnSavzoTDqQ24FYdWoYnifzypFUX2Kqq5BMf55qqaS1925aizDYTXusS4DfH3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JjDCWYgK; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JjDCWYgK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/hkVtJuqMmPanY/D/A7Wnu/Sa/hQFT8f7LFHmoik42c=; b=JjDCWYgK5AbdTDWKPakOci/2Xm
	bxGOjwifOPt+UG6azqzATPx4GN/MxMjNFsWVH6enZLf0LDNU/fwJXpoZUuHuhJfCRHaYW2HjD+qdy
	KMjJoCvUZFj32qiR5Og2s/GHcU9Mi16clEsb/Mq65NsxoZ4DAZlEcuNdrTknr69Ah2HDxt6JLh74V
	zLh8PuI2I6KMKk4q9y6U118jVloR5wRENRn+TTnOKBI9DurX7WAzxC38rzpqbvXxqrDFiyavdRfXk
	DdaYJrD4DaIMn51fqpb8hF/oBp1RMh6LE/pOKT+IHJfE0J35N6eOf7p+2G52+X3GC6IJO7tE85lyd
	XtMOsFGw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuIw0-0000000HBXA-2jGG;
	Thu, 13 Aug 2026 00:04:36 +0000
Message-ID: <45fc722b-ed8f-4906-8792-02c5b102f4b9@infradead.org>
Date: Wed, 12 Aug 2026 17:04:36 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] Docs: software-requirements.rst: add lzop, lzma and
 ip-route2
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260812120805.1631430-3-manuelebnerli@mailbox.org>
 <20260812122149.1635408-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260812122149.1635408-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/12/26 5:21 AM, Manuel Ebner wrote:
> lzma is required with HAVE_KERNEL_LZMA set to y
> lzop is required with CRYPTO_LZO set to y
> ip-route2 is mentioned in software-requirements below.
> 
> add tools to
>  software-requirements.rst
>  ver_linux
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/process/software-requirements.rst | 4 ++++
>  scripts/ver_linux                               | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/process/software-requirements.rst b/Documentation/process/software-requirements.rst
> index 69d31a3b5be3..5fdfcf6a0c01 100644
> --- a/Documentation/process/software-requirements.rst
> +++ b/Documentation/process/software-requirements.rst
> @@ -47,9 +47,12 @@ GNU make               4.0              make --version
>  GNU tar                1.28             tar --version
>  GRUB                   0.93             grub --version || grub-install --version
>  gtags (optional)       6.6.5            gtags --version
> +ip-route2              6.14.0           ip -V
>  iptables               1.4.2            iptables -V
>  jfsutils               1.1.3            fsck.jfs -V
>  kmod                   13               kmod -V
> +liblzma                5.8.1            lzma -V
> +lzop                   1.04             lzop -V
>  mcelog                 0.6              mcelog --version
>  mkimage (optional)     2017.01          mkimage --version
>  nfs-utils              1.0.5            showmount --version
> @@ -66,6 +69,7 @@ squashfs-tools         4.0              mksquashfs -version
>  udev                   081              udevadm --version
>  util-linux             2.10o            mount --version
>  xfsprogs               2.6.0            xfs_db -V
> +xz                     5.8.1            xz -V
>  ====================== ===============  ========================================
>  
>  .. [#f1] Sphinx is needed only to build the Kernel documentation
> diff --git a/scripts/ver_linux b/scripts/ver_linux
> index 1d860c8a37f3..5e99a5699f1a 100755
> --- a/scripts/ver_linux
> +++ b/scripts/ver_linux
> @@ -37,16 +37,19 @@ BEGIN {
>  	printversion("GRUB", version("grub-install --version"))
>  	printversion("gtags", version("gtags --version"))
>  	printversion("iptables", version("iptables -V"))
> +	printversion("ip-route2", version("ip -V"))
>  	printversion("Isdn4k-utils", version("isdnctrl"))
>  	printversion("jfsutils", version("fsck.jfs -V"))
>  	printversion("Kbd", version("loadkeys -V"))
>  	printversion("kmod", version("kmod -V"))
> +	printversion("liblzma", version("lzma -V"))
>  
>  	while ("ldconfig -p 2>/dev/null" | getline > 0)
>  		if ($NF ~ libc || $NF ~ libcpp)
>  			if (!seen[ver = version("readlink " $NF)]++)
>  				printversion("Linux C" ($NF ~ libcpp? "++" : "") " Library", ver)
>  
> +	printversion("lzop", version("lzop --version"))
>  	printversion("mcelog", version("mcelog --version"))
>  	printversion("mkimage", version("mkimage --version"))
>  	printversion("Module-init-tools", version("depmod -V"))
> @@ -69,6 +72,7 @@ BEGIN {
>  	printversion("util-linux", version("mount --version"))
>  	printversion("Wireless-tools", version("iwconfig --version"))
>  	printversion("xfsprogs", version("xfs_db -V"))
> +	printversion("xz", version("xz -V"))
>  
>  	while ("sort /proc/modules" | getline > 0) {
>  		mods = mods sep $1

-- 
~Randy
