Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B172874FF;
	Tue, 23 Dec 2025 16:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766507300; cv=none; b=aqqADs0AZHL9P2p0ftPynhcnGukskuJSzsnjIfa3/Wcr7x9r+BDdTmShLYG3zui3XtLI2uYT/CYO3cyh6sFGTAkJPfjtS54n3ZI+kOTqdtGjuuELAPFlzJL/yKbfaT5H6o8TpmhI3qHyYdCnkUOmrxF4e5OSwpePkbQCZq9cEbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766507300; c=relaxed/simple;
	bh=1F2Zj+2njSt5moO8g4iGnH+134BmLjJduhFI1MxZQIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUj5JW1O3utQS4TpuW8Nxcse9bbaCFok2u0DL4CXNeZz6Wd8/y7gGsjw3HeTg82b9y9cdU8QrySXdJK+B3IyWXDMYlT0dtPJfBSuHEc0w10/OVKFdUp5IzQpniq6UhT4zNsMJ8vLFHmTA/6rSkLRyh0z1DjTgANyVxMm7RUbac8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T+qbUMU3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T+qbUMU3"
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D969182E;
	Tue, 23 Dec 2025 17:28:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766507284;
	bh=1F2Zj+2njSt5moO8g4iGnH+134BmLjJduhFI1MxZQIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+qbUMU3hgOB1+QcSutEoG0hGWuDWUahwdRdFj4iuM7C9uu6y1XByC4DvM7qCKHrF
	 D3qcdBj9rYE8aT1pWbsWEGrzwhsKPh70nbs2sq/qjJ59hv40EdOLl8vh1f09chPLZZ
	 U0F0wI3wpfvn3xwhf49X3ndFpt+b8f+Cgmn1LG5g=
Date: Tue, 23 Dec 2025 18:27:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Drew Fustini <fustini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation/process: maintainer-soc: Be more
 explicit about defconfig
Message-ID: <20251223162756.GA25011@pendragon.ideasonboard.com>
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251223150256.GI9817@pendragon.ideasonboard.com>
 <f858ea0e-24d5-4cdd-ab57-dfeebe67ae7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f858ea0e-24d5-4cdd-ab57-dfeebe67ae7b@oss.qualcomm.com>

On Tue, Dec 23, 2025 at 04:32:02PM +0100, Krzysztof Kozlowski wrote:
> On 23/12/2025 16:02, Laurent Pinchart wrote:
> > On Tue, Dec 23, 2025 at 03:27:27PM +0100, Krzysztof Kozlowski wrote:
> >> It is already documented but people still send noticeable amount of
> >> patches ignoring the rule - get_maintainers.pl does not work on
> >> arm64/configs/defconfig or any other shared ARM defconfig.
> >>
> >> Be more explicit, that one must not rely on typical/simple approach
> >> here for getting To/Cc list.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>
> >> ---
> >>
> >> Incorrectly addressed patches for arm64/defconfig are around ~2 per month...
> >> ---
> >>  Documentation/process/maintainer-soc.rst | 6 ++++--
> >>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
> >> index 3ba886f52a51..014c639022b2 100644
> >> --- a/Documentation/process/maintainer-soc.rst
> >> +++ b/Documentation/process/maintainer-soc.rst
> >> @@ -57,8 +57,10 @@ Submitting Patches for Given SoC
> >>  
> >>  All typical platform related patches should be sent via SoC submaintainers
> >>  (platform-specific maintainers).  This includes also changes to per-platform or
> >> -shared defconfigs (scripts/get_maintainer.pl might not provide correct
> >> -addresses in such case).
> >> +shared defconfigs. Note that scripts/get_maintainer.pl might not provide
> >> +correct addresses for the shared defconfig, so ignore its output and manually
> >> +create CC-list based on MAINTAINERS file or use something like
> >> +``scripts/get_maintainer.pl -f drivers/soc/FOO/``).
> > 
> > I fear this will be another piece of documentation that people won't
> > read. It would be more effective to implement custom logic in
> > get_maintainer.pl (or at least output an informative message).
> 
> Part of the logic is already there, but I will not grow that - I don't
> want to touch Perl code. It's pretty obvious the tool should be do it,
> so feel free to fix it.

Even if I knew perl, I'd have no time :-)

> No point however to stop proper documentation.

-- 
Regards,

Laurent Pinchart
