Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A10EED8;
	Sun, 19 Apr 2026 19:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776625658; cv=none; b=EsqKKHXsv9tbVlyqMescAuM+qjEuV0rg3c080el8xzDceZ5wVh94ZNSH0/9UPBWaLusquzJCEbEzlssn7N3krR7eJE2dvoEJf41Slmo/vPJscAr56bjNneOMp2AEpdiY7Wz7LuFj4B9HnaaY7CgRbG/aW2NYxo214tYzDkJhSbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776625658; c=relaxed/simple;
	bh=CLN/WytTm5Iyitqeq5WgLKn12mSy9O29jgFf5PJ1nqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q455sxFA5dgvSIghv5JZ5AmySQtOqOmMMl8AZYRJx5RTCMi2qDjTbydFTWRF3iWzjeCZMamwphOpWbJ18d3jU+CIrvVEDrxCOo7U2cMXPk4Y6zXDCSGf+3hQvnAOHB2Rpfqv+BaWPhqimY1C89odIDjEm09VVJJhrzT0yv2gSxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvqeAI5Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvqeAI5Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0C2C2BCAF;
	Sun, 19 Apr 2026 19:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776625657;
	bh=CLN/WytTm5Iyitqeq5WgLKn12mSy9O29jgFf5PJ1nqQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JvqeAI5YOhaFnwRk0ai+Xp5cF9LJbDyfC6O/rff6/2HzqpzXUjMlXl5c+t/wXaYoT
	 txV57DUNkdCZWThfVymtG5zNHw9m8GpDtb1qkSLpr76cVzmIBO/V4P+Lx1ZPN15452
	 bLtug+6bRzvsAkRlGivmRzLYMxu8EJj+eERjsdL0z7l+y0dW3zmzDpFw5jOfWFMKUs
	 pLxys6SlEh7xOOEnjxxxUX/0hR5G7a+0nFMRAHA+cGkDC5tSLIXKfcdExSKjAC1SwU
	 Av72Rehz4czWTQSLHeO9dnskWe/Lkm19OW2P8X5JP6eisw1DLuFH4C5AoatBI3hhir
	 ZVNnKQzLSBOiA==
Date: Sun, 19 Apr 2026 21:07:30 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org, Dan Williams
 <djbw@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 01/11] MAINTAINERS: add an entry for media
 maintainers profile
Message-ID: <20260419210730.3c9a84d1@foz.lan>
In-Reply-To: <63c25cd9-2145-40c7-b1bc-463214d5df6c@infradead.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
	<361c00348573e45b4e06b674b2b45e47dc65c938.1776405189.git.mchehab+huawei@kernel.org>
	<63c25cd9-2145-40c7-b1bc-463214d5df6c@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 18 Apr 2026 17:02:55 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 4/16/26 11:11 PM, Mauro Carvalho Chehab wrote:
> > The media subsystem has a maintainers entry profile, but its entry
> > is missing at MAINTAINERS.
> > 
> > Add it.
> > 
> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Message-ID: <5af4aa6a716228eea4d59dc26b97d642e1e7d419.1776176108.git.mchehab+huawei@kernel.org>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f0b106a4dd96..620219e48f98 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16115,6 +16115,7 @@ S:	Maintained
> >  W:	https://linuxtv.org
> >  Q:	http://patchwork.kernel.org/project/linux-media/list/
> >  T:	git git://linuxtv.org/media.git
> > +P:	Documentation/driver-api/media/maintainer-entry-profile.rst
> >  F:	Documentation/admin-guide/media/
> >  F:	Documentation/devicetree/bindings/media/
> >  F:	Documentation/driver-api/media/  
> 
> I now see 2 P: entries for MEDIA INPUT INFRASTRUCTURE
> and 2 P: entries for X86 ARCHITECTURE.
> (don't know how/why)
> 
My patches (and my tests) are based on docs-next. Perhaps some other
patch is adding them as well.

I'll rebase them on the top of -rc1 after it gets released.

Thanks,
Mauro
