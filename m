Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2F0288C1C
	for <workflows@vger.kernel.org>; Wed, 28 May 2025 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748445749; cv=none; b=e4C19MY2jn8Uodx3dhJA+zl49ASYnHekKFZJTAVFa/y4F4itw33eAZ/dw8ZMhKOznN60o4k2hVnsTQ0qzusn8+adWrbj3kn+s/AVcvjrbehZYSBTL8Gs3n8J7DHgyAFGctQs06JinD2N1wcjbnx9pA2A7nVUObCtsqVFRNkdqdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748445749; c=relaxed/simple;
	bh=vXHM5veutIeLCu/uOd/Vqm9nm1yLNMlBy3XMNnRYgk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOLO81iKvi5b+lzlh7Lj5WPtzSovrVR3Q8dgPUwuTCeUcE9XFow2nEts+lUr8494jFd/gYew4iWZHJ6ajg0GYu35Qya5bj8A0fq3ulLrPDZjrdXUPp8zIsR68BFXnfN2iGqZLlQ2E/TmdeRV6SPKg0uwzs6tbO1R7Me2307SvwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ps796MAh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ps796MAh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44770C4CEE3;
	Wed, 28 May 2025 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748445748;
	bh=vXHM5veutIeLCu/uOd/Vqm9nm1yLNMlBy3XMNnRYgk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ps796MAhChLTc91tWPcj8s1xoXYF9XuYZPzSmXW2xZ5GOmIStXKsX7b4YCru1AayP
	 ZTJBG9kkjdOHMUhwnN7bJcU4l87d1xN/AbfVDw/NUPWLds9wQ0VVpXCcLeyppXQdnm
	 +jF5up5O/51Du8ukpGQiFy6b7I/tOI/hSN+1X6tM=
Date: Wed, 28 May 2025 11:22:27 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: workflows@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: Re: Depends-on tag
Message-ID: <20250528-sparkling-expert-taipan-5ad429@meerkat>
References: <67f86f2e-d3ac-4fbe-87d6-186487de5721@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <67f86f2e-d3ac-4fbe-87d6-186487de5721@oss.qualcomm.com>

On Wed, May 28, 2025 at 07:19:55AM -0700, Jeff Johnson wrote:
> patchwork itself very recently formalized the usage of a 'Depends-on:' tag for
> flagging patchset dependencies:
> 
> https://lists.ozlabs.org/pipermail/patchwork/2025-January/007465.html
> https://lists.ozlabs.org/pipermail/patchwork/2025-March/007490.html
> https://github.com/getpatchwork/patchwork/commit/bc2d1b1dcf89c619e027ae4dfd3036cba30e5583
> https://patchwork.ozlabs.org/project/patchwork/list/?series=442332&state=*
> 
> Note that this support is only in mainline and not part of any release yet.
> 
> Curious if the Linux Kernel community will adopt this approach for flagging
> dependencies.

We've been supporting something like this in b4 for a while now, but we use
prerequisite-* trailers (not tags) and always expand that into
prerequisite-patch-id, since that's the only format documented by git itself.

E.g. here is an example of a series using prerequisite-change-id:
https://lore.kernel.org/b4-sent/20250526-sip_svc_upstream-v3-0-6a08a4502de3@altera.com/

Here's another one using prerequisite-message-id:
https://lore.kernel.org/b4-sent/20250514-ipq5018-pcie-v10-0-5b42a8eff7ea@outlook.com/

The documentation is here:
https://b4.docs.kernel.org/en/latest/contributor/prep.html#working-with-series-dependencies

I'm not sure "Depends-on:" as an actual commit tag will be accepted by the
kernel community, because it's information that is only useful during
pre-commit stages. However, if it's passed along as a cover letter/first patch
trailers, we can recognize it as an alternative for "prerequisite-message-id".

-K
