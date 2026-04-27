Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE67317715;
	Mon, 27 Apr 2026 02:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777256555; cv=none; b=HKJMG/2cUdQFGNX80M3N1+MdR6b3KOZjeMz05otdRWAqgAIFPQ/vnkqoLpjt64U4tST4+g0vOkLM1EaGrhXOxfKbvD6g4t4Fc0HgIsEhSiRSKIeKfne/vs968iQAUdnFOZtzsOSqzRvzU7ZmKXBSoG8a0T5oICnHvWKUYGNWvyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777256555; c=relaxed/simple;
	bh=11/XhBL0BQ/18bfiG44/OdJ0OAruPKuMueFCeeKXne4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhLV2nkjoqRQNArWCtSsCaQU2XJHomtCIQ3KSfIL7rHfFMpcQMNXU5g95AIElXlQosrJdKqA97MthPfxKPHvjfHH2huPu82AO53JE56yA0AcViAxHY+PR39+Ul60Lavkm5kltKSJydG9qaw26EL/wMHZ/dJdWJHyMvuP5hFjwAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=CzVMRdGE; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="CzVMRdGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1777256550; bh=vz5x2IQ04Cd63QTBTasEJ7DRKJq62Z5gdynqSWJN26k=;
	h=From:Message-ID:From;
	b=CzVMRdGEkkSwss7ngwtlkT8qimRdpusSpsAcnv1RPkT4o954sOFwqnSkbGhnRNmoq
	 jlFFzvO5exgHsKpHzsjXZoh/xefY9cyOnd5TziG7oFhE5PFEfqY9HtH47qKWXGvzia
	 dEvJQKzm1Ch1L9yXCN6PneHPe12IMyTdfSBDQbwo=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 1AB29C0D47;
	Mon, 27 Apr 2026 04:22:30 +0200 (CEST)
Date: Mon, 27 Apr 2026 04:22:29 +0200
From: Willy Tarreau <w@1wt.eu>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: greg@kroah.com, leon@kernel.org, security@kernel.org,
        Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/3] Documentation: security-bugs: clarify requirements
 for AI-assisted reports
Message-ID: <ae7IZZUwV7j7_czA@1wt.eu>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-4-w@1wt.eu>
 <133e96b7-251d-4af2-8084-2adca3e547e4@infradead.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <133e96b7-251d-4af2-8084-2adca3e547e4@infradead.org>

On Sun, Apr 26, 2026 at 12:36:28PM -0700, Randy Dunlap wrote:
> 
> 
> On 4/26/26 9:39 AM, Willy Tarreau wrote:
> > +Use common sense when evaluating the report. If the affected file has not been
> > +touched for more than one year and is maintained by a single individual, it is
> > +likely that usage has declined and exposed users are virtually non-existent
> > +(e.g., drivers for very old hardware, obsolte filesystems). In such cases,
> 
>                                          obsolete
(...)

Thank you Randy for your reviews! I'll apply the fixes and resend in a
few days if there are no more comments.

Willy
