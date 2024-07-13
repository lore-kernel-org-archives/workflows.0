Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C2513A256;
	Sat, 13 Jul 2024 14:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720880852; cv=none; b=nkLE6qxbgNR+nwpWS/lxpOR0BJT21nVGX5b4Ftx1jollhtmocf6eTKXQa9marREDk9jfQltFzY9r1Vl/K4nz+QOgoXBVeMsEbxY1jcDSCKOi6O4omlW9y3RnHvoKDsMbepnITRWKEAVmu5wmlyTq+jCBeUxzSV5hGA871PlAtPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720880852; c=relaxed/simple;
	bh=7cevQbo60M2mKolj3MLaNCiI+bBLBZYIE+dawomqLpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRuoZmkCDIVAGBU1fTIwwa2p4qTzFqTFlqmRzUhVaYsuzXMezKenCdAuBYOpA/n+CMkvNdB0wi8GG+NAbKz9dZO1h3DR6LF4qzrtpyYs5SFwjUdDt6WOPhYl19E5sSTcpi3kBKYal2dn5eROjAgVKjIZdKWcbdnys6GdXaHPkLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LsoyREdh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LsoyREdh"
Received: from pendragon.ideasonboard.com (unknown [185.201.63.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38D5ECDB;
	Sat, 13 Jul 2024 16:26:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720880813;
	bh=7cevQbo60M2mKolj3MLaNCiI+bBLBZYIE+dawomqLpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LsoyREdhMtZ7INxT5iwEgGwxEQ79055RhLLztM/yg6eCgNOIgI55YJNrveYNMFw3a
	 3dptrDQsQ5udCmHACqQiyeUZwZKFHU/r+hTbB+xtb8e/6Filv51NSAvjxVJ2iPo64W
	 CQBY+V9WpWzjPWteAe+tFxs7BnRtKmAXuYKKm1gQ=
Date: Sat, 13 Jul 2024 17:26:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <20240713142651.GI10946@pendragon.ideasonboard.com>
References: <20240712144903.392284-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240712144903.392284-1-kuba@kernel.org>

Hi Jakub,

Thank you for the patch.

On Fri, Jul 12, 2024 at 07:49:03AM -0700, Jakub Kicinski wrote:
> Multiple vendors seem to prefer taking discussions off list, and
> ask contributors to work with them privately rather than just send
> patches to the list. I'd imagine this is because it's hard to fit in
> time for random developers popping up with features to review into
> packed schedule. From what I've seen "work in private" usually means
> someone on the company side will be assigned to handle the interaction,
> possibly months later. In worst case, the person scheduled to help
> the contributor takes over and writes the code themselves.
> This is not how the community is supposed to work.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: workflows@vger.kernel.org
> CC: linux-doc@vger.kernel.org
> ---
>  .../maintainer/feature-and-driver-maintainers.rst     | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/maintainer/feature-and-driver-maintainers.rst b/Documentation/maintainer/feature-and-driver-maintainers.rst
> index f04cc183e1de..ac7798280201 100644
> --- a/Documentation/maintainer/feature-and-driver-maintainers.rst
> +++ b/Documentation/maintainer/feature-and-driver-maintainers.rst
> @@ -83,6 +83,17 @@ bugs as well, if the report is of reasonable quality or indicates a
>  problem that might be severe -- especially if they have *Supported*
>  status of the codebase in the MAINTAINERS file.
>  
> +Open development
> +----------------
> +
> +Discussions about user reported issues, and development of new code
> +should be conducted in a manner typical for the larger subsystem.
> +It is common for development within a single company to be conducted
> +behind closed doors. However, maintainers must not redirect discussions
> +and development related to the upstream code from the upstream mailing lists
> +to closed forums or private conversations. Reasonable exceptions to this
> +guidance include discussions about security related issues.

Overall I think this is fine, but I'm a bit concerned it could be
interpreted too broadly. Brainstorming on mailing lists is hard, and
kernel communities often conduct technical discussions face to face, in
conferences or other events. Sometimes those discussions are as private
as they can get, I've found myself cycling multiple times to the office
of a fellow developer who happens to work close to my place in order to
discuss kernel API design in front of a white board. We did our best to
publish brainstorming notes on mailing lists, and patches are then of
course reviewed and further discussed in public. Is this a behaviour you
want to discourage, or is this considered fine ?

> +
>  Selecting the maintainer
>  ========================
>  

-- 
Regards,

Laurent Pinchart
