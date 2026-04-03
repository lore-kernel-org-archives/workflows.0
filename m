Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509AD377EA9;
	Fri,  3 Apr 2026 11:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217074; cv=none; b=YWexhc3pRkm6VLxfUy2CSQDYlNmnck0EdrQ/LSo72DLtbriMXPmCvDaynvd1bbt41fCxdsAGr/6pbhz2NpwnrER/3rupbZ9nXyA5HopaHw/ho2D08mewkmyFWkKL1EOGE9J3/yU7xue3nRmjzywKf/0rW9qXWPQYPx0wGQYsm0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217074; c=relaxed/simple;
	bh=m5oYYxfegYrbip1+kwznsffOseaKS1U9+M5gGsEPeh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kmo86lub3MqbXuQUb/KBL/uxpLKJYXaiVXTHU53vOBqscEX1TPPnym9I5mhL5EoaOlDq2xRFDRo2hLLI6oSFUAfFlSbD/Sbd4I4Q8H0R3NldeQzMxYDNDO749HNNPhkK2viOUuVV3g3tLKXQ5ildSQPHuU67oXOMS34TFpf+C8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=Kb2HwSre; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="Kb2HwSre"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1775217068; bh=/GMT2pew5uzETaGffA8RC320jiwmkcJaccfuTeMtXWY=;
	h=From:Message-ID:From;
	b=Kb2HwSre+1ivwT5H4Em2I379VJJmd6svWAj8f7lhxjkTtJhk1OYaFIqCFSgy48ZD9
	 n/N3NxTvMLCu5JuxZOBGRkiwvbJICz2cLp8BGBIJlLflugxwxK2wSC4ZIvUu9AYb8/
	 NE6idnfH4ZtEc/+ySU6WkFvzWQpHfV3uN3giHJ+g=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 4AB2DC0AC9;
	Fri, 03 Apr 2026 13:51:08 +0200 (CEST)
Date: Fri, 3 Apr 2026 13:51:07 +0200
From: Willy Tarreau <w@1wt.eu>
To: Greg KH <greg@kroah.com>
Cc: edumazet@google.com, rdunlap@infradead.org,
        Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Documentation: clarify required info in security
 reports
Message-ID: <ac-pq44YBI5AIdQ7@1wt.eu>
References: <20260403062018.31080-1-w@1wt.eu>
 <2026040324-coping-vacation-7d64@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026040324-coping-vacation-7d64@gregkh>

On Fri, Apr 03, 2026 at 01:11:47PM +0200, Greg KH wrote:
> On Fri, Apr 03, 2026 at 08:20:15AM +0200, Willy Tarreau wrote:
> > Hi Greg,
> > 
> > I'm sending you the doc clarifications we discussed for the process of
> > reporting security issues. It's cut into the 3 patches I shared this
> > morning on the security list (plus two typos fixed and a paragraph
> > asking for one single issue per report):
> > 
> >   - one patch that reminds our need for a valid e-mail address
> >   - one that explains to reporters how to proceed to find maintainers
> >     addresses, hoping we won't have to do it for 90% of reports anymore
> >   - one that enumerates basic requirements for every report
> > 
> > I think it covers the difficulties we've faced this week. As always,
> > we might possibly find tiny adjustments to add, but my goal would be
> > for such updates to be merged in time to update the public page ASAP
> > so that we can redirect incomplete reports in an attempt to lower the
> > team's current load.
> 
> Looks great, thanks.  I've applied these to one of my trees and will get
> them to Linus in time for 7.0-final.

Thank you!
Willy
