Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530AF249E5;
	Thu, 13 Aug 2026 00:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786579437; cv=none; b=kj7V80h7OSjshfi3lP+4Db5j8QEhFRhPX/fm+2V/CxHIOg4Ex9jdT5diL8brdHfj6/g9iTzmuOJFskkZu1SRHEsdRhtDn+wvLjGJCXJF94CPbgsMTiGNdHv7T2t8GdPRHbjZp+nGryHG7oEFwOL7UH5ld24o/nYrLEyGy7ttsSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786579437; c=relaxed/simple;
	bh=UPJuI5pLdbfDh+sVivWJGfoz9ZxtAr0LVL99flB2nBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A+DBhLNNYC8BF1yeUQ011tZFl/6xuVr8ZZ3SXbgsQs/yd27F4LEjplLtZZs21Kout6QXz094YzGDA/1P8cwknxTyvX6WuzRMAc/QmzLD6zOsYpYPi+8xVaJNQEKn+h8nOK2mxiNIorz4UxRSGmjK/VXFjiw4SeCXjXwGNC5Pxfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PmLACNfp; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PmLACNfp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=n4l2hyHsWsWZ2iHZhwhrRU3FLusOH4BJvfk4tF8nlxU=; b=PmLACNfpPUghYCNmSihIlIom2o
	HZqZx0vn7OO06KRZu1SODFO8gzqhCgrb+8Ir9mAs6I5b3rVqRCqWrYWHN1P8W8CySyOMUW4XIx3X+
	gz1MFV6eMXRVPjbEBh4H9tJqZmwVI3DO32zvHNuxZ0u6kItgD88JT7L7ej8EJ4RFfhG8sE7CmsUA9
	mBn8/J89JYR42j78RFysdeEt9lxF2bXbTaMMuwMAzHuZ9ol6s6TSrExmIr14pKbWZmUy2uC5Zv1TL
	etOdZI82iYpnLqIWJxsRfWzj8sfRfb4YAm2jPToL7Gk/g2xjxZZVgAy5cRkjVMoDjozz1Kb7gTcOe
	7rv8Mq+w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuIvK-0000000HBUB-1dzg;
	Thu, 13 Aug 2026 00:03:54 +0000
Message-ID: <e797d4b0-1002-406a-9e92-81790c2c49d9@infradead.org>
Date: Wed, 12 Aug 2026 17:03:53 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] Docs: software-requirements.rst: Refine language
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260812120805.1631430-3-manuelebnerli@mailbox.org>
 <20260812121945.1635085-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260812121945.1635085-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/12/26 5:19 AM, Manuel Ebner wrote:
> This document grew over the years and isn't limited to compiling or running
> the kernel anymore.
> 
> compile -> interact
> levels -> versions
> run the current kernel version -> change code, compile, install and boot the current kernel version.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> I think the lines
> +This document is designed to provide a list of the minimum versions of
> +software necessary to change code, compile, install and boot the current
> +kernel version.
> could be extended beyond boot but I'm lacking thw words.
> Thoose tools would justify this: gdb, iptables, pcmciautils, ...
> 
> PATCH 5/5 is related to this patch.
> ---
>  Documentation/process/software-requirements.rst | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/process/software-requirements.rst b/Documentation/process/software-requirements.rst
> index 1ca8c5f73ad0..69d31a3b5be3 100644
> --- a/Documentation/process/software-requirements.rst
> +++ b/Documentation/process/software-requirements.rst
> @@ -1,13 +1,14 @@
> -.. _changes:
> +.. _software-requirements:
>  
> -Minimal requirements to compile the Kernel
> -++++++++++++++++++++++++++++++++++++++++++
> +Minimal requirements to interact with the Kernel
> +++++++++++++++++++++++++++++++++++++++++++++++++
>  
>  Intro
>  =====
>  
> -This document is designed to provide a list of the minimum levels of
> -software necessary to run the current kernel version.
> +This document is designed to provide a list of the minimum versions of
> +software necessary to change code, compile, install and boot the current
> +kernel version.
>  
>  This document is originally based on my "Changes" file for 2.0.x kernels
>  and therefore owes credit to the same people as that file (Jared Mauch,

-- 
~Randy
