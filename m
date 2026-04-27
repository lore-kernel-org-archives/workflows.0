Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEBC2D7DC8;
	Mon, 27 Apr 2026 15:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777304028; cv=none; b=UzwL1UBAmcQpDRCa6wX8PNFtmi4EIo6lZAMSiyGty0c35uvSLOdG4SMmdAHmKfQMsT1JPdLupf776WG3TEhDRudboKRRe35tGpeB7+c7D3q8t3TK3lW1wd1KBm6+pPlx/5dPA3l/MW4wQQs6ciF9R2UjbQgQMc9FAaP8MCLSwL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777304028; c=relaxed/simple;
	bh=jDPL3LLixTYvDKIUNxwCj/uRYveraoCGbQ9lD/ONznI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7Rt8Gb5P+69F8aDRdCQ6je+lXgUFabofVZTZihK6Bcyd+uvGaMFuffx9nlabn48iZt8EVc1rGBeLtNVu5v9+wDgVaWuJoipiTZBSInQjotOacLAeCZvWb37h8HNXVM/Mrcyf/Y2FTy+Ul8ZVxkQiL05CNSkVpiglcGkLlfQO8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC402C19425;
	Mon, 27 Apr 2026 15:33:47 +0000 (UTC)
Date: Mon, 27 Apr 2026 09:33:12 -0600
From: Greg KH <greg@kroah.com>
To: Willy Tarreau <w@1wt.eu>
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] Documentation: security-bugs: do not systematically
 Cc the security team
Message-ID: <2026042727-unselect-unlaced-37bb@gregkh>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-2-w@1wt.eu>
 <2026042727-recital-twiddling-eb22@gregkh>
 <ae9_ljvxw5I9arzQ@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae9_ljvxw5I9arzQ@1wt.eu>

On Mon, Apr 27, 2026 at 05:24:06PM +0200, Willy Tarreau wrote:
> On Mon, Apr 27, 2026 at 07:49:08AM -0600, Greg KH wrote:
> > On Sun, Apr 26, 2026 at 06:39:12PM +0200, Willy Tarreau wrote:
> > > With the increase of automated reports, the security team is dealing
> > > with way more messages than really needed. The reporting process works
> > > well with most teams so there is no need to systematically involve the
> > > security team in reports.
> > > 
> > > Let's suggest to keep it for small lists of recipients, to cover the
> > > risk of lost messages (spam, vacation etc) but to avoid it for larger
> > > teams.
> > > 
> > > Cc: Greg KH <gregkh@linuxfoundation.org>
> > > Cc: Leon Romanovsky <leon@kernel.org>
> > > Signed-off-by: Willy Tarreau <w@1wt.eu>
> > 
> > This is going to cut down on emails to us a bunch, which might be good,
> > or not, as now we'll not have a way to know what's going on overall.
> > But hey, let's try it and see what happens!
> 
> Or maybe we could suggest that first reports from a reporter should
> always Cc the list ? After all, every time we asked to drop the list
> was for senders at their 5th or 10th submission. Maybe we could just
> say that the list members prefer not being repetitively CCed by the
> same submitters to invest more time on newcomers ?

Yes, that might be better, otherwise maintainers are going to get some
pretty foolish reports with out the context of howing to properly at
least push back on them, like we have gotten good at doing :)

thanks,
greg k-h
