Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EB444E040;
	Mon, 11 May 2026 18:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778522622; cv=none; b=VpE6lWxSpQqT5kXGOfazcvvkUTwU9pNBH/HZ9+rwjMxbMdQ8rpBV/hL3CGkVffGvbM90RG7qJU9qfxlpXFyfyeaI8SOzmiWiKtXS9uTElGPymxKOCMWZ/9zPPFcKM0pSZHLLf3L/IJjNXm4V4GecvVS+lNqLgKncXFy5SyWcF+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778522622; c=relaxed/simple;
	bh=6CkTUVRQcz+BVjYoiylUCr1aQYzD7nVYT2gLQlwwNz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhBI20VYeJYOzRp3UHNeIYQ3RUbaFw34VJYZPDeaOH9vAy0jN0+j5Ji1Og9xmC8YIUR6+Hnci6rYmLeLTW1xCVhQ7jFqDl7d+GqYUJy4nZHYkUrVB/IE3Odk4Yag5bSmbW3WwgkbfI8OGRkH48ptVhdTAcJYDGRBceA2u00CLOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=kMDAKMHD; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="kMDAKMHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778522611; bh=tl4LqQHOdh7skXgAUyFfCSkKXDOXIcnx3HeXLIv/328=;
	h=From:Message-ID:From;
	b=kMDAKMHDq/B/qaFaAkQNjDME9jH7/tPzGqDQO2ZABOZ1zusXsQMFQR+uIOC7i3JvY
	 /1T4zU+nnsjsIYOql85TrboSwxo6DKaTqapGYrtYZwZw+s4Lre9UMKtm4YoBVsHI0t
	 MeItvTDgY/CslDcTCTHRuA4Ecgyee0gSVsuumfiY=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id B6029C0A37;
	Mon, 11 May 2026 20:03:31 +0200 (CEST)
Date: Mon, 11 May 2026 20:03:31 +0200
From: Willy Tarreau <w@1wt.eu>
To: Greg KH <greg@kroah.com>
Cc: Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, security@kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <agIZ8zeg3m0xE3yL@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-3-w@1wt.eu>
 <2026051124-afar-renewal-795c@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051124-afar-renewal-795c@gregkh>

On Mon, May 11, 2026 at 07:28:57PM +0200, Greg KH wrote:
> On Sat, May 09, 2026 at 11:47:54AM +0200, Willy Tarreau wrote:
> > The use of automated tools to find bugs in random locations of the kernel
> > induces a raise of security reports even if most of them should just be
> > reported as regular bugs. This patch is an attempt at drawing a line
> > between what qualifies as a security bug and what does not, hoping to
> > improve the situation and ease decision on the reporter's side.
> > 
> > It defers the enumeration to a new file, threat-model.rst, that tries
> > to enumerate various classes of issues that are and are not security
> > bugs. This should permit to more easily update this file for various
> > subsystem-specific rules without having to revisit the security bug
> > reporting guide.
> > 
> > Cc: Greg KH <gregkh@linuxfoundation.org>
> > Cc: Leon Romanovsky <leon@kernel.org>
> > Suggested-by: Leon Romanovsky <leon@kernel.org>
> > Suggested-by: Greg KH <gregkh@linuxfoundation.org>
> > Reviewed-by: Leon Romanovsky <leon@kernel.org>
> > Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> > Signed-off-by: Willy Tarreau <w@1wt.eu>
> > ---
> >  Documentation/process/index.rst         |   1 +
> >  Documentation/process/security-bugs.rst |  38 +++-
> >  Documentation/process/threat-model.rst  | 236 ++++++++++++++++++++++++
> >  3 files changed, 274 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/process/threat-model.rst
> 
> Looks great, thank you!
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Want me to take it through one of my trees now to get it to Linus this
> week, or should it go through the documentation tree?  Either is fine
> with me.

Yes, please take it as usual, it's simpler for me and it will likely
allow it to be published ealier, which ultimately should help us
faster ;-)

Thanks!
Willy
