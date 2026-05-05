Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CB317A31E;
	Tue,  5 May 2026 14:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990211; cv=none; b=aBk1ZfljQwAm0ViVIZn8acdFz77kH/a7WEVjyVQ1AV5Meyb5Bx+p0nVMu1awm8bhS8zw2y/RXHiEXnKWTNgkpfccoqNmV06AdAeg7RLgrk2o5+NefFwiOS2Om//KcGm5sdHXIkSntMK2pEn7HN39IwWQ4pm8M5ioXl8EoQV4TmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990211; c=relaxed/simple;
	bh=+iX0UHCItJ/oja7poULSVE4xmgLag7TUnMoCmTMxDQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCwFnfikUAfApVN/ugJCX5dTGjBFOJYC5z2xd0huWK+7BXmmtE21Mwmv90kXbZUkBqzH5+oTE7fFc9y0WnVoMwDAH5x6YzbQNzSyPQmo05bkcFMI7gVP4TYjHcK5Q0BfR9sfkcmkewYtZlqTmieutaNB5iqLTEYWGqQ2i4zglKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5AcpnbH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5AcpnbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F586C2BCB4;
	Tue,  5 May 2026 14:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777990210;
	bh=+iX0UHCItJ/oja7poULSVE4xmgLag7TUnMoCmTMxDQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5AcpnbHzNUjiBzSoOUOZnlaIpjk7EwrNWydwNIsOuLjkGTRPbWwVXviH3qaOFLWk
	 94888Az940/QQegLeZOXBRRp0FBGTXxjegxRiGhSthjzrd7Ii76q6EM5o0z+ClNlVG
	 4OV4gSZfZOxYn3GNhxOsgl0yzjrN2DW/aIJ6FdxH2YFcCZXy3OhMeJAli8rvYVX1Ya
	 ywEcFcz2oLc0lAh1H65mvwShMbf8fDNo608ZGn2d86U9Fu2bskmvP4f14XdVZf3xrE
	 9D2+BB8cm9+7IOBOQXeaxtSm1fdJef4U7gc8Ob+/nqMI+RaKWnJxFkM9VIyIr83ffp
	 xtT9Zz5U6dPWg==
Date: Tue, 5 May 2026 17:10:04 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: greg@kroah.com, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <20260505141004.GE11063@unreal>
References: <20260503113506.5710-1-w@1wt.eu>
 <20260503113506.5710-3-w@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503113506.5710-3-w@1wt.eu>

On Sun, May 03, 2026 at 01:35:05PM +0200, Willy Tarreau wrote:
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
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  Documentation/process/index.rst         |   1 +
>  Documentation/process/security-bugs.rst |  28 +++
>  Documentation/process/threat-model.rst  | 231 ++++++++++++++++++++++++
>  3 files changed, 260 insertions(+)
>  create mode 100644 Documentation/process/threat-model.rst

Thanks,
Reviewed-by: Leon Romanovsky <leon@kernel.org>
