Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563C38821;
	Fri, 12 Jul 2024 15:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720796819; cv=none; b=WGUxiQ2hREO0BSq1D10XrG/DMxgsUSRuc00wOBGtl9kTTnnTpDV2FBXYPg7olD7edESyrwGalI60a/OyFx26uOsJodCHtycVLx+aaYCtHfZ5Dh113QQHh3xCR5bk8jBfN28DfeNfiU2ucumc7/JsjEhWLCWc2X2fDbeHd3kfUqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720796819; c=relaxed/simple;
	bh=YcE/C00R/RtJBUBJFbcgkdvnBnaGU6xHIE0GiNYppU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilIx5rmyl9h+ZAfjt9yXuajsepwzxlomW9bbX7AwQlQPvEV6oybpEyQOnsMvpnaLGLqtNVCp67s70Dp8z6HXqMnLIwq82849mtWPA5QJacy1IttlN42oeygmiALscP0PDfzormwuG18SC2Ql3q0lPb3WENofNQ4YBqGlyuvRPgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JG7p/7wE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JG7p/7wE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DDCC32782;
	Fri, 12 Jul 2024 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720796818;
	bh=YcE/C00R/RtJBUBJFbcgkdvnBnaGU6xHIE0GiNYppU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JG7p/7wEwtYXBK7I+V2IAmdRHCMgFALQ3VlEvlhxa9PAXZrG3kdP5YgqkjpkpWaxm
	 46DtYcH2wWJzVZSukLaWyISc0ARoK/ooHIIaRx3hULsVCBvylF8KD4wWV6FLZP39hg
	 r3vK+I27dxsYrKz6MLsefhw+EG48D9DL0FBxCmQE=
Date: Fri, 12 Jul 2024 17:06:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <2024071244-outcast-shrivel-c2c6@gregkh>
References: <20240712144903.392284-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712144903.392284-1-kuba@kernel.org>

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
> +
>  Selecting the maintainer
>  ========================
>  

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
