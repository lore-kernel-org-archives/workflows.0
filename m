Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C63934B1A4;
	Wed,  7 Jan 2026 18:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767811955; cv=none; b=Y9ZCUxPfHQ09huN/QYEdNgJ7jEwflMkeRx5Xmt70q7pKVbO2CS3vdtt3nC52r3dc3tcvcHalRHDT5f9FyZit1ixpy1bneEsYDaxiB1z3KSPaE9r4dXHpIY4514/a3or35TzwUEL6S2vHyCLU8/7yEUavFVTEan0eGUcFFWoQI5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767811955; c=relaxed/simple;
	bh=/3SzDaj+qchgcHL0Vdxso4YvMFLK7lRtDLkUl3jRgXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4hshX16y6K38iF7mLk1slIVfM6zSouAB8EVk8kspL097IXCh4WJ91U72thRoiLyhS3fTaPYoq5M0dA+WhuVvyUbZ2OnuqCPOD/ig9MlSpblT4fMND+kjqZdFE8V/KDDgALAPFzumACUD+4wYRJ/P7ZDo9kQu3Asb4Vxk+iBhyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uMl3z8Xp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uMl3z8Xp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB90C4CEF1;
	Wed,  7 Jan 2026 18:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767811954;
	bh=/3SzDaj+qchgcHL0Vdxso4YvMFLK7lRtDLkUl3jRgXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uMl3z8XpS0Ju539wrGRBX+FmnPAgEIdhnFuoRGeD67+MamufuVVAx4hAAnu3MX3bD
	 C9Ynv2tF4OhczGazTmgI9UeoydflpqGqK8NRchKJ7ElZ3ptlqO8CkO0gvn5Wjgg5zF
	 zRHqgO6YWZM7V3EqRbybEOSA5rZInG3eikPSPC3M=
Date: Wed, 7 Jan 2026 19:52:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-spdx@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LICENSES: Explicitly allow SPDX-FileCopyrightText
Message-ID: <2026010724-activate-saggy-9c08@gregkh>
References: <20260107171246.242973-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107171246.242973-2-krzysztof.kozlowski@oss.qualcomm.com>

On Wed, Jan 07, 2026 at 06:12:47PM +0100, Krzysztof Kozlowski wrote:
> Sources already have SPDX-FileCopyrightText (~40 instances) and more
> appear on the mailing list, so document that it is allowed.  On the
> other hand SPDX defines several other tags like SPDX-FileType, so add
> checkpatch rule to narrow desired tags only to two of them - license and
> copyright.  That way no new tags would sneak in to the kernel unnoticed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Other way would be to remove SPDX-FileCopyrightText from existing files
> and disallow this, but one way or another we should be explicit about
> it.  Otherwise people will be sending more of these and each maintainer
> would need to make their own call.
> ---
>  Documentation/process/license-rules.rst | 2 ++
>  scripts/checkpatch.pl                   | 9 +++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/process/license-rules.rst b/Documentation/process/license-rules.rst
> index 59a7832df7d0..8d7c0214f283 100644
> --- a/Documentation/process/license-rules.rst
> +++ b/Documentation/process/license-rules.rst
> @@ -66,6 +66,8 @@ License identifier syntax
>     '#!PATH_TO_INTERPRETER' in the first line.  For those scripts the SPDX
>     identifier goes into the second line.

As you are adding a copyright identifier, this sentence should probably
be:
	For those scripts, the SPDX license identifier goes into the
	second line.

> +   Identifier line can be followed by another one with SPDX-FileCopyrightText.

How about:

"The license identifier line can then be followed by a
SPDX-FileCopyrightText line if desired."


> +
>  |
>  
>  2. Style:
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 362a8d1cd327..98261ee97e2b 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3844,6 +3844,15 @@ sub process {
>  			     "Misplaced SPDX-License-Identifier tag - use line $checklicenseline instead\n" . $herecurr);
>  		}
>  
> +# check for unused SPDX file tags

# check for unsupported SPDX file tags

thanks,

greg k-h
