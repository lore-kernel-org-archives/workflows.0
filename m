Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF16F3D3CE6;
	Mon, 11 May 2026 17:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778520539; cv=none; b=XBrgojLlZGMDiwUUlLhCF1f7FqGP/KF6hsfaCWL+/qFslyZ1MRJzsgaa20WX4H4cA8dIIw5+bn9d9pzCW7bYW4fBVpMD8nF7xXu9r7/+Zsi7Vw7qsauWeTq5S0xFssMOu7BAXH2mOI/z6catNWrC4N2rDGrbXKcazroLJ7hN8Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778520539; c=relaxed/simple;
	bh=2R+cGAJ8m0eWnSMo+6GdYRccArp9mz1S1V2ewSxCRME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEjt7HtQoAQwPr0Pq5+MMu29Qzh9H2p+Qe/XRgQ/IPzERoPrK7d1GMtMG1gYVZKDN2Fz/5hOVJse1D2XFkCAF55gJuHiywVDjxXprbXher30kWYnUpMSQxPCLr0GU/1LlNIeSsgxhNRb3jSkzGfyYvN3yp0uvoNmNdMIhcK9yy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E920C2BCC9;
	Mon, 11 May 2026 17:28:59 +0000 (UTC)
Date: Mon, 11 May 2026 19:28:57 +0200
From: Greg KH <greg@kroah.com>
To: Willy Tarreau <w@1wt.eu>
Cc: Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org, security@kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <2026051124-afar-renewal-795c@gregkh>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-3-w@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509094755.2838-3-w@1wt.eu>

On Sat, May 09, 2026 at 11:47:54AM +0200, Willy Tarreau wrote:
> The use of automated tools to find bugs in random locations of the kernel
> induces a raise of security reports even if most of them should just be
> reported as regular bugs. This patch is an attempt at drawing a line
> between what qualifies as a security bug and what does not, hoping to
> improve the situation and ease decision on the reporter's side.
> 
> It defers the enumeration to a new file, threat-model.rst, that tries
> to enumerate various classes of issues that are and are not security
> bugs. This should permit to more easily update this file for various
> subsystem-specific rules without having to revisit the security bug
> reporting guide.
> 
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Leon Romanovsky <leon@kernel.org>
> Suggested-by: Leon Romanovsky <leon@kernel.org>
> Suggested-by: Greg KH <gregkh@linuxfoundation.org>
> Reviewed-by: Leon Romanovsky <leon@kernel.org>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  Documentation/process/index.rst         |   1 +
>  Documentation/process/security-bugs.rst |  38 +++-
>  Documentation/process/threat-model.rst  | 236 ++++++++++++++++++++++++
>  3 files changed, 274 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/process/threat-model.rst

Looks great, thank you!

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Want me to take it through one of my trees now to get it to Linus this
week, or should it go through the documentation tree?  Either is fine
with me.

thanks,

greg k-h
