Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAF047F2E8;
	Tue,  5 May 2026 14:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990234; cv=none; b=FnqYPG9AJ+TDVS8F6QBgrRFuO83uavQ+kWc8PWS4fL1A5dYBGOIuAGxKesVTjdP6SiAGVXN/ypfMUseoGZZOzcAYBN6R7T9yZmhB5VI7lNyZjm+faulpS5ey+u2YWZy1rbSQ/QqiIFJfliWZQsM7PbF+fQC+7bbJWiC9QCb01Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990234; c=relaxed/simple;
	bh=PPs+MCdi3kcKTLrOhTGnx9SXIHnkphdqWHSxvNJPass=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtCDXE4kE3vIRVXXt/fPxxfOIoCtQUABS9k9f0SJNcOH9mSqQ9uHcF//rcQNcdwiOx1mIvI+NI14EogMAFaSuSdE8vj8By4k2I3HGABbTXukYidmMvVPv0gQLoWJQ0ncQ+SLuoszbhg3LwlHxUq/nVbGgnBQiIku5QISPmGcsuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aaIzbeIx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aaIzbeIx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69BF9C2BCB4;
	Tue,  5 May 2026 14:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777990234;
	bh=PPs+MCdi3kcKTLrOhTGnx9SXIHnkphdqWHSxvNJPass=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aaIzbeIxVXl52jpmLrC4C5ezJjSF/hJxI59auFCJTxKGZJspGgY2aQTBanaLa8zmO
	 JAHAhoJmnC2CQPHxDGbSvOwAtMw84Wc0a8KXEt8UjpsVTjTmM2uMJX1ixhH0DnC/jk
	 O17CUJwJqjLHNenB90pZp9xBeQeuDH7mmLVXWQj+jRQ3l8Qcg8NPG+JynkaCOLHYzQ
	 bt4yEVSiZBmUUCMSDx4OI8OuBcS5I24aqF35NaqKCyZLv5EGo211NDMHs5e4GIh/ZO
	 iMTVSDoSzpoQkGh+1hKRu6qP3fSzwkuzfwnT0A4/vMOohCWvqvFyT1XmzuLv0fes1C
	 xLd4eBL1BS7Rw==
Date: Tue, 5 May 2026 17:10:28 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: greg@kroah.com, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/3] Documentation: security-bugs: do not
 systematically Cc the security team
Message-ID: <20260505141028.GF11063@unreal>
References: <20260503113506.5710-1-w@1wt.eu>
 <20260503113506.5710-2-w@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503113506.5710-2-w@1wt.eu>

On Sun, May 03, 2026 at 01:35:04PM +0200, Willy Tarreau wrote:
> With the increase of automated reports, the security team is dealing
> with way more messages than really needed. The reporting process works
> well with most teams so there is no need to systematically involve the
> security team in reports.
> 
> Let's suggest to keep it for small lists of recipients and new reporters
> only. This should continue to cover the risk of lost messages while
> reducing the volume from prolific reporters.
> 
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Leon Romanovsky <leon@kernel.org>
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  Documentation/process/security-bugs.rst | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Thanks,
Reviewed-by: Leon Romanovsky <leon@kernel.org>
