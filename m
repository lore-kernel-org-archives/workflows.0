Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC473254B0;
	Fri, 23 Jan 2026 07:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152790; cv=none; b=XiDclneeXOLspHdu8Cw2/3hAeF70Irox6qhuFLgwaufwCZBi3V7cRPJYUQE+kYcjgROdKF9T7z6CKvaywV6S2vK4J/box1YdzG2eW15ZMtRw4U/kmUIKPhy3LweFgD5PxxJbNIWBnzRMAhHzDuLRxlBh5SLOlATbrNmmWucb6Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152790; c=relaxed/simple;
	bh=mTjrJ9+8GOkvqmy85tak8Y5uwBDn2oAYfbTWbj8Yx+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nj8bOPWbj2L0YoCDh8vwTClaBgFznRuJTPtVH5h97C8d2xCo2z+Qe+HXWuXeajAgbmD9vC5SNbTZAVSr3GG1+7xfESnQkjrB7iXY3lxstzTooKpi20+I9iZFwMppC/g+bMN3rq37DGHzqet1XSE9mbGTtF+5B+AFaSOEhOjpumU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oDKrGSX5; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oDKrGSX5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=pLz6ur2fCmn/LE9RZwR0nlW1EVjnsdgwb2RLhZX3aU8=; b=oDKrGSX5aVFLsyzqlpwVBs5R87
	V/OmYwKwsXukWFmYk9onj+Q3IyCN9qNHTbw/QxRGf6W+logG1rlcZYQ3x3VdikOJXMgDHjRxWbF3l
	7pIO9xe/xATSg4+bwzEJbs+kKlOZx5Hpoww4JPBZ5jeouZ8dm4YQSgwE8pvG+4rJA+Mg16EIpEz7J
	cv8h+4x7s6YV6XoOMV+SDrAA8jXmnkHmxjSX6ijEd/Z0529tP1/hk5OPee0cLAgYkCCE91PYbXoIZ
	C8KXcyVuzC0B0d+Um1VZH22SJuydavImFHrYQ81byL//c1//oQX87ioIilV0PoMWmtrdwibJejGfR
	3Xa7HzTw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBSO-00000008Mta-1mjZ;
	Fri, 23 Jan 2026 07:19:48 +0000
Message-ID: <d9147abf-0b08-40e2-aa49-821c953f5fc7@infradead.org>
Date: Thu, 22 Jan 2026 23:19:48 -0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] doc: development-process: add notice on testing
To: Dmitry Antipov <dmantipov@yandex.ru>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <658caf3b-aeb6-49c7-9e5a-1eab175dd1b3@infradead.org>
 <20260123071523.1392729-1-dmantipov@yandex.ru>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260123071523.1392729-1-dmantipov@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/22/26 11:15 PM, Dmitry Antipov wrote:
> Add testing notice to "Before creating patches" section.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Andy also Acked it. I think you could/should include
his Ack here as well.

Thanks.

> ---
> v2: adjust spelling and wording according to Randy
> ---
>  Documentation/process/5.Posting.rst | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
> index 9999bcbdccc9..07d7dbed13ec 100644
> --- a/Documentation/process/5.Posting.rst
> +++ b/Documentation/process/5.Posting.rst
> @@ -40,7 +40,12 @@ sending patches to the development community.  These include:
>   - Test the code to the extent that you can.  Make use of the kernel's
>     debugging tools, ensure that the kernel will build with all reasonable
>     combinations of configuration options, use cross-compilers to build for
> -   different architectures, etc.
> +   different architectures, etc. Add tests, likely using an existing
> +   testing framework like KUnit, and include them as a separate member
> +   of your series (see the next section for more about patch series).
> +   Note that this may be mandatory when affecting some subsystems. For
> +   example, library functions (resides under lib/) are extensively used
> +   almost everywhere and expected to be tested appropriately.
>  
>   - Make sure your code is compliant with the kernel coding style
>     guidelines.

-- 
~Randy
