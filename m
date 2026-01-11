Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BAB500952;
	Sun, 11 Jan 2026 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768148152; cv=none; b=L9dJM4dt0Gdz6EeA8faFRsfElFYMuhpGhiTJ/5fwN79EkTNZ46njK1PU+R7c6t17LUO6OrLFGPfNmfQnmJKK7IiXY7fXU0AeZL1/OvBn2kw9+B94AwbkXgPbOkUb/fRfAORoGMHMGfDHq6+L7lP8MR/U5kCpi4Gccj8BYXpi36o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768148152; c=relaxed/simple;
	bh=kLhMisAa/rBUQQBL287Z1+puYPJeMaVUYKgaDJ1OfqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDEQ0SiU7HG+M3X8EjfRmgxUpECbTHKSF1UiuoBZBbk3ofWxX/6JyTDtDPPmvKDzYglLiyvVR14+ZxkMDyU/R9EwVRps/ixaWz2QbCDyu2j9jX7+mhYJAw2SFNP4Vf5XT5jPi1YdbZUFpEa3ZkEVACrWdHKUJfTpIUsxtHybS2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SHsEEalJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SHsEEalJ"
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 414AD447;
	Sun, 11 Jan 2026 17:15:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768148123;
	bh=kLhMisAa/rBUQQBL287Z1+puYPJeMaVUYKgaDJ1OfqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHsEEalJP2kuxnEMaspwjZ1Vm2KYFs8IpEwbjO4m2uOsrgf9FzQ6o+uIpi6wWgKzy
	 ZOmdoiZ/1vRC/6t8QI13/G4Kw29mXiRy+wNRzDaQPZTWMUPt4pyMRr6rDP17wTZeH1
	 InITH6hAfWySuJoRTiC5AvtgWrSYNyo3tlzk6nTM=
Date: Sun, 11 Jan 2026 18:15:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-spdx@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] LICENSES: Explicitly allow SPDX-FileCopyrightText
Message-ID: <20260111161527.GA25101@pendragon.ideasonboard.com>
References: <20260111160750.17569-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260111160750.17569-2-krzysztof.kozlowski@oss.qualcomm.com>

On Sun, Jan 11, 2026 at 05:07:51PM +0100, Krzysztof Kozlowski wrote:
> Sources already have SPDX-FileCopyrightText (~40 instances) and more
> appear on the mailing list, so document that it is allowed.  On the
> other hand SPDX defines several other tags like SPDX-FileType, so add
> checkpatch rule to narrow desired tags only to two of them - license and
> copyright.  That way no new tags would sneak in to the kernel unnoticed.
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Joe Perches <joe@perches.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Other way would be to remove SPDX-FileCopyrightText from existing files
> and disallow this, but one way or another we should be explicit about
> it.  Otherwise people will be sending more of these and each maintainer
> would need to make their own call.

My only concern is that we're endorsing two different ways to express
copyright information. That usually leads to different subsystem setting
different rules, and worse, to people sending conversion patches.

I don't mind how copyright information is expressed. The
SPDX-FileCopyrightText tag has the advantage of being machine-parseable,
even if the value of the extracted information is somehow dubious from a
legal point of view. Other than than, both ways seem fine. I have a
slight personal preference for standardizing things, but the SPDX
specification doesn't mandate a particular formatting of the
SPDX-FileCopyrightText value, so there will always be different styles
anyway.

> Changes in v2:
> 1. Doc adjustments based on feedback from Greg and Laurent.
> 2. "unused" -> "unsupported"
> 3. Drop redundant blank line
> ---
>  Documentation/process/license-rules.rst | 7 +++++--
>  scripts/checkpatch.pl                   | 8 ++++++++
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/process/license-rules.rst b/Documentation/process/license-rules.rst
> index 59a7832df7d0..5cc58168e3d9 100644
> --- a/Documentation/process/license-rules.rst
> +++ b/Documentation/process/license-rules.rst
> @@ -63,8 +63,11 @@ License identifier syntax
>     The SPDX license identifier in kernel files shall be added at the first
>     possible line in a file which can contain a comment.  For the majority
>     of files this is the first line, except for scripts which require the
> -   '#!PATH_TO_INTERPRETER' in the first line.  For those scripts the SPDX
> -   identifier goes into the second line.
> +   '#!PATH_TO_INTERPRETER' in the first line.  For those scripts, the SPDX
> +   license identifier goes into the second line.
> +
> +   The license identifier line can then be followed by one of multiple

s/of multiple/or multiple/

> +   SPDX-FileCopyrightText lines if desired.
>  
>  |
>  
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 362a8d1cd327..cc2a5882fef8 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3844,6 +3844,14 @@ sub process {
>  			     "Misplaced SPDX-License-Identifier tag - use line $checklicenseline instead\n" . $herecurr);
>  		}
>  
> +# check for unsupported SPDX file tags
> +		if ($rawline =~ /\bSPDX-.*:/ &&
> +		    $rawline !~ /\bSPDX-License-Identifier:/ &&
> +		    $rawline !~ /\bSPDX-FileCopyrightText:/) {
> +			WARN("SPDX_LICENSE_TAG",
> +			     "Unsupported SPDX tag\n" . $herecurr);
> +		}
> +
>  # line length limit (with some exclusions)
>  #
>  # There are a few types of lines that may extend beyond $max_line_length:

-- 
Regards,

Laurent Pinchart
