Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BC1331A54;
	Wed,  7 Jan 2026 19:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767814666; cv=none; b=YnKeX+0BdeWORn1R8Q6bmsnU8MbBei2cG/jVs43qXGV1xeK2Ho92i4T9NXHb/BeAreF/yIvRoQ0H4Sn7ySq7YyjguVygqgxXt+rzhFFQ7WI/fibZARK3TTDOhgLd/dgESZNTPZUnh51NlAs9UmFl4OWfEzc6tdNUCCgnFJAEYeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767814666; c=relaxed/simple;
	bh=F6+gBsOoaO+ThkcUmzMSvfYQY2zAoFNNxXwaCS6P4K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aeauSLj2+tFtSjfsLuZMUWu2goz5GtYdg6te/hafDiQr8t5aHuRdcipi/jOeGfDy3nf4okubMjmXONZjNovF0+biLemU64Rfx8wvIgDjjTNRiEH6B6F0K7x64Tf/aFTew7+Equl8UkMRXDk0lXYD+5TB3X3MjtDCVTl5qEwXhr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tKftKXv+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tKftKXv+"
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 408AA593;
	Wed,  7 Jan 2026 20:29:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767814168;
	bh=F6+gBsOoaO+ThkcUmzMSvfYQY2zAoFNNxXwaCS6P4K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tKftKXv+ZZQoVPkNrSLzPuM3sn9dlBfNJE7CXNxbCr7fKiwywiyqeHVIvw6dZ55DS
	 e2jwN/kNydRq2YPtrKHeH2jhXmu5WSi79X87JK8cLH40ki6pekGpzz8qN0hifjm5Gj
	 E4wdiKN5v+9MAfed5zuSf1o1d5pDdyubvMgsmPXY=
Date: Wed, 7 Jan 2026 21:29:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-spdx@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LICENSES: Explicitly allow SPDX-FileCopyrightText
Message-ID: <20260107192929.GE20168@pendragon.ideasonboard.com>
References: <20260107171246.242973-2-krzysztof.kozlowski@oss.qualcomm.com>
 <2026010724-activate-saggy-9c08@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2026010724-activate-saggy-9c08@gregkh>

On Wed, Jan 07, 2026 at 07:52:31PM +0100, Greg KH wrote:
> On Wed, Jan 07, 2026 at 06:12:47PM +0100, Krzysztof Kozlowski wrote:
> > Sources already have SPDX-FileCopyrightText (~40 instances) and more
> > appear on the mailing list, so document that it is allowed.  On the
> > other hand SPDX defines several other tags like SPDX-FileType, so add
> > checkpatch rule to narrow desired tags only to two of them - license and
> > copyright.  That way no new tags would sneak in to the kernel unnoticed.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > 
> > ---
> > 
> > Other way would be to remove SPDX-FileCopyrightText from existing files
> > and disallow this, but one way or another we should be explicit about
> > it.  Otherwise people will be sending more of these and each maintainer
> > would need to make their own call.
> > ---
> >  Documentation/process/license-rules.rst | 2 ++
> >  scripts/checkpatch.pl                   | 9 +++++++++
> >  2 files changed, 11 insertions(+)
> > 
> > diff --git a/Documentation/process/license-rules.rst b/Documentation/process/license-rules.rst
> > index 59a7832df7d0..8d7c0214f283 100644
> > --- a/Documentation/process/license-rules.rst
> > +++ b/Documentation/process/license-rules.rst
> > @@ -66,6 +66,8 @@ License identifier syntax
> >     '#!PATH_TO_INTERPRETER' in the first line.  For those scripts the SPDX
> >     identifier goes into the second line.
> 
> As you are adding a copyright identifier, this sentence should probably
> be:
> 	For those scripts, the SPDX license identifier goes into the
> 	second line.
> 
> > +   Identifier line can be followed by another one with SPDX-FileCopyrightText.
> 
> How about:
> 
> "The license identifier line can then be followed by a
> SPDX-FileCopyrightText line if desired."

I'd write "by one of multiple" instead of "by a" as multiple copyright
owners for the same file is common in the kernel.

> > +
> >  |
> >  
> >  2. Style:
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 362a8d1cd327..98261ee97e2b 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -3844,6 +3844,15 @@ sub process {
> >  			     "Misplaced SPDX-License-Identifier tag - use line $checklicenseline instead\n" . $herecurr);
> >  		}
> >  
> > +# check for unused SPDX file tags
> 
> # check for unsupported SPDX file tags

-- 
Regards,

Laurent Pinchart
