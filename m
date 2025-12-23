Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820F8286897;
	Tue, 23 Dec 2025 15:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766502201; cv=none; b=mkmAnMhdy7LxsMgdCY2VQOr6fDbZulHYsz1OUmyGRr5Y5enkD0FzLSZ+G8AAsZTasMVfOmAEavInVDvhuWPv/+Sjq2IKrcBf5/M8B9fjPdFDynnue1s81Y9gyqOZt9voOAW/awl+m/A91zgzay//rh6fMkHswyx2BrDq7lc8StY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766502201; c=relaxed/simple;
	bh=+pdYS7oe+ITloB9NSURDJAUtEhD90+1rBYIWPa+W0+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmhcSmULxO3qaiDCVsPVx2sqaf6cZym5jzpOT/Xu4sNfR8iMTAR9XmkcQDvR/jUlNEa+mY05bCNC7iupmigYzPMlkjtfVF5N5RbpAxA68BzFxkCXbzryXdXpFyCUrZR3d3Q1kYVXrGZ21aYKrLhmwE9DBXt7cSlNuvi2yzrJxYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OLQh1bYJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OLQh1bYJ"
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 02DA1833;
	Tue, 23 Dec 2025 16:03:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766502184;
	bh=+pdYS7oe+ITloB9NSURDJAUtEhD90+1rBYIWPa+W0+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLQh1bYJiqifUkTNmfTC4646turpArYJ6YSdrSmenY5w2VVgKkX9J2qh5crWXqOCl
	 MS7XBJ1XLKmdY+dAPNUiC/YpCONHhQVjUKXekH3f0cv6bnArHKjK4z4KQOtnGQ0ZVj
	 v9+tbw0t1WWw14tj+cHvP77oIeqzhORHYSaquSi0=
Date: Tue, 23 Dec 2025 17:02:56 +0200
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
Message-ID: <20251223150256.GI9817@pendragon.ideasonboard.com>
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>

Hi Krzysztof,

On Tue, Dec 23, 2025 at 03:27:27PM +0100, Krzysztof Kozlowski wrote:
> It is already documented but people still send noticeable amount of
> patches ignoring the rule - get_maintainers.pl does not work on
> arm64/configs/defconfig or any other shared ARM defconfig.
> 
> Be more explicit, that one must not rely on typical/simple approach
> here for getting To/Cc list.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Incorrectly addressed patches for arm64/defconfig are around ~2 per month...
> ---
>  Documentation/process/maintainer-soc.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
> index 3ba886f52a51..014c639022b2 100644
> --- a/Documentation/process/maintainer-soc.rst
> +++ b/Documentation/process/maintainer-soc.rst
> @@ -57,8 +57,10 @@ Submitting Patches for Given SoC
>  
>  All typical platform related patches should be sent via SoC submaintainers
>  (platform-specific maintainers).  This includes also changes to per-platform or
> -shared defconfigs (scripts/get_maintainer.pl might not provide correct
> -addresses in such case).
> +shared defconfigs. Note that scripts/get_maintainer.pl might not provide
> +correct addresses for the shared defconfig, so ignore its output and manually
> +create CC-list based on MAINTAINERS file or use something like
> +``scripts/get_maintainer.pl -f drivers/soc/FOO/``).

I fear this will be another piece of documentation that people won't
read. It would be more effective to implement custom logic in
get_maintainer.pl (or at least output an informative message).

>  
>  Submitting Patches to the Main SoC Maintainers
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
Regards,

Laurent Pinchart
