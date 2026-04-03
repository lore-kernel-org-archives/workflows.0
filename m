Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACD81B6D1A;
	Fri,  3 Apr 2026 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214713; cv=none; b=EqMI2kSI03idvZCSxsWqu7jGu/fY56d7B8o5vzVD6tJRZ0Q2jYuj8xI7dsbZ4Er+6Gtg6BVyPwaJ/mnBrapBvPas+I43ZuQTy8wCX7XZmaqsxmFqq/lES00ST4355IKtOztYbWioLn7kaJ0c/bVPRvn2ue3dqQnzW63aS93vwBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214713; c=relaxed/simple;
	bh=doXqhd8dr/1LTFZ1jpumVKfG6zz20yN+icBTelXv3YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVVZZ7OLK9QW8W8rVg/YZiMqq0Vwt0p3W9u6X8TVDuM5EJPic/rBuTftiGU3RVQ0F2ix4uaa4z2wBnLBAFPDgzW9JCxMxGacHe0OgW4m+yp0pmsk9pqs/Xnqc6qo4aTMqtekfhcmgHS4gh/K56uc5ru7kwBa6W+IGVhiHc1WTuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Rxqkvt+O; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eSZiD4yf; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Rxqkvt+O";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eSZiD4yf"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C730614002DF;
	Fri,  3 Apr 2026 07:11:50 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 03 Apr 2026 07:11:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1775214710; x=1775301110; bh=cG7tV/2w7j
	tLpWh0FgPMz/4JYz/46AXMbgusfPJiYpE=; b=Rxqkvt+OXbRvLhxdEhFjuf6i5p
	L5USS1WDhhImBKyHzHIo/ozFTcAMT+b9IMRql4qgh3ZvRu0jfmq1408dPNZfnxJZ
	BvuKUX3lWH+gXd5QsE41AImRz0NKiSmymzeA+ulAnLzXLA5G67ixc6c8eBseTCUc
	AK9/ug2SufnmTa00n0Seh1UUutkp6hSavZp0fYG92zXI/G3o/vMAiQ54uYaGsaU/
	LKDAQAFw8RisivzAxG+QpLJjZwafKAZ2ymp6OTh82F2643k0u6l2FANh6u8rXCuO
	saGztGsRRPwZNQYts2Sgu+E6uICd7htY6GajulPmyQcc0wok/QxePpEOrx5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775214710; x=1775301110; bh=cG7tV/2w7jtLpWh0FgPMz/4JYz/46AXMbgu
	sfPJiYpE=; b=eSZiD4yfBMjDgYQ8rpjYY1wwpEtE9Y7r06zYCRV7gEYsGU+WxBy
	0S4C5GrhNICBotFVWFS+ylIQ3RA5iP9XVzaEfQy/QLPExeRlWTjp+xL+zRbjASm+
	YNe6lm80V3UphJYi1BF7VtRMDXWvK52qxEefnJoe+6/hZh16v1a+AHKQ34OwACoq
	t3F8rYOWpZmfKiujKPQzhevIZOhpJXjLy1EUlL1lvXeq7ZCW7dy33uk4lIzoYzkY
	MbFjvJ/Bv9veR7jkEufVsK7UGDL0pdJOuOC/ldrd6EvMNoOzcPKUE5teIlXoE4X1
	NZKW5p0oMcZjyk2zB9safY3yfh/UIdxTImg==
X-ME-Sender: <xms:daDPaTPkjozPMv-FGQYkBvAmA6Z6pkDK0Z3Hxl9SYLlbdGPtL6T_1g>
    <xme:daDPae55GQ8_USYxJGrMY4lPBj3f8sxjYYj2AGmWGkWkrJd2PEtUPRA0OD9mgByl-
    3uKpB3tIX5DrVaYlc6q4Q4aMgYJ-tRCeIoblEV7kZkeOK4Z>
X-ME-Received: <xmr:daDPaSnEefuem65g3xYpBjzOuV24CXWhbPa_91bIhlbRiHOjgj-y6SbqOI6kQiUbx6OT-IEyP__VDqSHE20fbiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfmjfcu
    oehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvdelje
    eugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtoh
    hmpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    fiesudifthdrvghupdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomh
    dprhgtphhtthhopehrughunhhlrghpsehinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    oheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepshhkhhgrnheslhhinhhugi
    hfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeifohhrkhhflhhofihssehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:daDPaWIlY4osVjfXX5tmIdZrW5Z0KdJjTdxfaTJuDMntNJyh98JvEQ>
    <xmx:daDPaSSZGiz8lhpuMo30KnpSGltX1PUqBU5o93SBVXucbriEePtV4A>
    <xmx:daDPaTtLXlskvRoc2u97le8a4-l7Pnd0HQCpljMAqLatbDmdMC4bvg>
    <xmx:daDPaV-mAubczm1CwqfHkTBfzcoGHUZRvvr501lMY4mJtSXw3aLj4Q>
    <xmx:dqDPaTCktbz_5UVxlrm7ORTKMqvj0I9DIcdqJB_ur_8Go3GrARlofnLF>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Apr 2026 07:11:49 -0400 (EDT)
Date: Fri, 3 Apr 2026 13:11:47 +0200
From: Greg KH <greg@kroah.com>
To: Willy Tarreau <w@1wt.eu>
Cc: edumazet@google.com, rdunlap@infradead.org,
	Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Documentation: clarify required info in security
 reports
Message-ID: <2026040324-coping-vacation-7d64@gregkh>
References: <20260403062018.31080-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403062018.31080-1-w@1wt.eu>

On Fri, Apr 03, 2026 at 08:20:15AM +0200, Willy Tarreau wrote:
> Hi Greg,
> 
> I'm sending you the doc clarifications we discussed for the process of
> reporting security issues. It's cut into the 3 patches I shared this
> morning on the security list (plus two typos fixed and a paragraph
> asking for one single issue per report):
> 
>   - one patch that reminds our need for a valid e-mail address
>   - one that explains to reporters how to proceed to find maintainers
>     addresses, hoping we won't have to do it for 90% of reports anymore
>   - one that enumerates basic requirements for every report
> 
> I think it covers the difficulties we've faced this week. As always,
> we might possibly find tiny adjustments to add, but my goal would be
> for such updates to be merged in time to update the public page ASAP
> so that we can redirect incomplete reports in an attempt to lower the
> team's current load.

Looks great, thanks.  I've applied these to one of my trees and will get
them to Linus in time for 7.0-final.

greg k-h
