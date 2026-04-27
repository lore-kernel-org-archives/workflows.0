Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E662FFDEA;
	Mon, 27 Apr 2026 16:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306198; cv=none; b=r3PFwKqY+x7gzJHbdTiBrgsbt2BWlzrcpxgVfHt89tFHor5jlR4+e5QQHaJ8jMqXaRSu3MmxytBUj9OrRyyn8FeqxznbKyfhanQKmDnpc0mgWn/swH0SEOQyRjrRYXkK3SytMYz7UBOMsaUZeQJi1ZVCG9fDA022RpUPyTxW7/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306198; c=relaxed/simple;
	bh=6PCjWpf/TcX1fr3PqzO0NoxIcrlrRFRlClDFHnZ2Gg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0wRYQNaFkIV0gy1qNuzfRcyqzn679FUUKKjLa+ZeQbO2dZHuXpERs7KZQE6TECl8S8WkY9I3iolYuoVZ8SKYoxZvftpUDKbPGkG0/CUHFFnfGi380G3y/5vpWWxAzzl25041cLS0JAb2BcZAW4eNkN+c+pFbxlrttjbA1KPj5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=rPv1oHYj; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="rPv1oHYj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1777306194; bh=UEjUKyheWtRvd0JjqNjN5By2/ywWhTc/J/VtxRqj6OM=;
	h=From:Message-ID:From;
	b=rPv1oHYjYNoBExAId4ifyKCQWhVV/vlLkfUD8ua8NEUAYgHiFM0MIruxYsibxh552
	 /RpYBh5AEei1YdUPzoUOID8BWYYiL32G8IHLGoCdoM0NjnZF0rxBZLr+k/mv6uxfMV
	 Xu97LTOe7i+7nqjhTV08cBRrtiEpO7aorqgFlnk4=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id A868CC0B69;
	Mon, 27 Apr 2026 18:09:54 +0200 (CEST)
Date: Mon, 27 Apr 2026 18:09:54 +0200
From: Willy Tarreau <w@1wt.eu>
To: Greg KH <greg@kroah.com>
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] Documentation: security-bugs: do not systematically
 Cc the security team
Message-ID: <ae-KUtEGB0qv1BcR@1wt.eu>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-2-w@1wt.eu>
 <2026042727-recital-twiddling-eb22@gregkh>
 <ae9_ljvxw5I9arzQ@1wt.eu>
 <2026042727-unselect-unlaced-37bb@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026042727-unselect-unlaced-37bb@gregkh>

On Mon, Apr 27, 2026 at 09:33:12AM -0600, Greg KH wrote:
> On Mon, Apr 27, 2026 at 05:24:06PM +0200, Willy Tarreau wrote:
> > On Mon, Apr 27, 2026 at 07:49:08AM -0600, Greg KH wrote:
> > > On Sun, Apr 26, 2026 at 06:39:12PM +0200, Willy Tarreau wrote:
> > > > With the increase of automated reports, the security team is dealing
> > > > with way more messages than really needed. The reporting process works
> > > > well with most teams so there is no need to systematically involve the
> > > > security team in reports.
> > > > 
> > > > Let's suggest to keep it for small lists of recipients, to cover the
> > > > risk of lost messages (spam, vacation etc) but to avoid it for larger
> > > > teams.
> > > > 
> > > > Cc: Greg KH <gregkh@linuxfoundation.org>
> > > > Cc: Leon Romanovsky <leon@kernel.org>
> > > > Signed-off-by: Willy Tarreau <w@1wt.eu>
> > > 
> > > This is going to cut down on emails to us a bunch, which might be good,
> > > or not, as now we'll not have a way to know what's going on overall.
> > > But hey, let's try it and see what happens!
> > 
> > Or maybe we could suggest that first reports from a reporter should
> > always Cc the list ? After all, every time we asked to drop the list
> > was for senders at their 5th or 10th submission. Maybe we could just
> > say that the list members prefer not being repetitively CCed by the
> > same submitters to invest more time on newcomers ?
> 
> Yes, that might be better, otherwise maintainers are going to get some
> pretty foolish reports with out the context of howing to properly at
> least push back on them, like we have gotten good at doing :)

Yes, and more importantly, we know how to react while some maintainers
getting their first report are stressed. Let me try to rework it.

Thanks!
Willy
