Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49159258CD7;
	Sun, 17 May 2026 16:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779033848; cv=none; b=BzPUH5i0rB0LAxE72sflBNp6KB9wIMzmxoKn0fLKoj3km2qZlT29mnpAxNlFS1PA/sboeG/eluynlo7zlX4lNYxoiP7ZijQuw/794ytAe0xojTAjxtzLHFmsAVTAGdSvACOt5WCOWNx877h4kM47oi6fUnXeGOJwN/A4A7ylojg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779033848; c=relaxed/simple;
	bh=ioyUDu2+K46BY8R0Oc8b1KTl4Fgz00hCZTqIHRJ/ZSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VyUjhpLBmtOA/IFCP+kuidepPebTQ+N5PqwWDvUbWFlo/iK4t/a+BMI08LMMNkAGPkpw70bteZn7dCfvd+QyKS1b+lIMCxYjbPc+jj7Fnv1Wx10Y1E/YqU2yHzwznm5pIpI4aCRdHurmmGTjj4sXRlTY05lba1jGWpB9ERoCjJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=HmPTkObh; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="HmPTkObh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1779033844; bh=zFjPfAdGDRd0GZefoEUnVJpgsHyVeWkzcyZx7EPB4GQ=;
	h=From:Message-ID:From;
	b=HmPTkObhC2s010Ftkd26AX5lomKsd14Axqd6ZYT/3VhlmQ1XlKiUyVWhkVfdiL8wT
	 P7q0uLWBej7QKvev6+OE0JgY/Xv3Y0Gj+w0/JaZiH1nsut3yONV8PfjcnB/YaC2t/5
	 ZYniFuc6Tmb/VPEUla+CK2Oj48TbWpVuU4DN5IJY=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 663DDC09D5;
	Sun, 17 May 2026 18:04:04 +0200 (CEST)
Date: Sun, 17 May 2026 18:04:04 +0200
From: Willy Tarreau <w@1wt.eu>
To: Baruch Siach <baruch@tkos.co.il>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: threat-model: add missing closing parenthesis
Message-ID: <agnm9A9SFsmvIFZg@1wt.eu>
References: <da8ee1e8b4e99261ec11544c4e1a4f81316ae965.1779032501.git.baruch@tkos.co.il>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da8ee1e8b4e99261ec11544c4e1a4f81316ae965.1779032501.git.baruch@tkos.co.il>

On Sun, May 17, 2026 at 06:41:41PM +0300, Baruch Siach wrote:
> Fixes: a03ef333fbd6 ("Documentation: security-bugs: explain what is and is not a security bug")
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Thank you, and sorry for this mistake!

Obviously: Acked-by: Willy Tarreau <w@1wt.eu>

Willy

> ---
>  Documentation/process/threat-model.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/threat-model.rst b/Documentation/process/threat-model.rst
> index f177b8d3c1ca..9dd8011dde82 100644
> --- a/Documentation/process/threat-model.rst
> +++ b/Documentation/process/threat-model.rst
> @@ -176,7 +176,7 @@ regular bug:
>    * problems seen only under development simulators, emulators, or combinations
>      that do not exist on real systems at the time of reporting (issues
>      involving tens of millions of threads, tens of thousands of CPUs,
> -    unrealistic CPU frequencies, RAM sizes or disk capacities, network speeds.
> +    unrealistic CPU frequencies, RAM sizes or disk capacities, network speeds).
>  
>    * issues whose reproduction requires hardware modification or emulation,
>      including fake USB devices that pretend to be another one.
> -- 
> 2.53.0
