Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E8038E5C6;
	Thu, 22 Jan 2026 11:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082989; cv=none; b=dLV2OuBKdlNi6aqqlbD15W/O16KrxjjwqdGQt5deHu/f0AGwy3fW69ZciHZaVWMm6a8YkffeJCmNmLVbuaAtoV+bTcA2Z8hn7eNb5INs9Vp+poZ/9mU/DHWiqi0hHOm6MyN0uuuf7COEp1UKap8jD164g9JPnMT1ZXIoTfiLoAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082989; c=relaxed/simple;
	bh=Ab9DVgwqa8XSz6z9wvN2hCb/1Nx3l5mYG9zv7yZ9Poo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJbn3hddL1QcJYsWFJpslbk3qmvDKmW0hBZtYKqpmXL4F+xkKSdiaQ84g+S7Hb/XDGHUUWlWM4YStwaoCxR6kOyqqmW/D1uow5aIMo0qFmQZ5OhpBlh0xVDKbBKX9O19xrXNWtMpE1/wVEcy5J1+DBTDEWOT8NuR1upLvCRby3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUp7odwN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUp7odwN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769082988; x=1800618988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ab9DVgwqa8XSz6z9wvN2hCb/1Nx3l5mYG9zv7yZ9Poo=;
  b=AUp7odwNBQl9gC6wJ+/bo2kslsn+qTBBW7p9arHAgDm3N5rAIwbMDOLP
   S7IANHoMTlThRntOvfcYSmhc7Zd8gg/Tw6C3EIyRitNHn5O8NgvM7Zkfo
   11vGbwcXfKQm6APEDCZBzhz9LiXlDLohg028nyhyGh+j0U91MFHBBfokJ
   n6pJncvQ0Vupg1WdJmSmFbMODNzjrUEnlKlAMcsf3+EoI2/rWgPpvgrIj
   ppIQF1JKM/5hH4w8B+tzXJkFQwzw/Oq2Pfs6jm5/TC2p9rx5e5Q27lQez
   11A4txC6d26TUw/8090hRnjC3m5wgHTLfUSbG3ZUGRP0FNwPmFDqShahG
   g==;
X-CSE-ConnectionGUID: s2Ql9ZWVSm+kFoIKi9BL/A==
X-CSE-MsgGUID: pLqmzWWYQR+xZz2K9HASeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="92987318"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="92987318"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 03:56:27 -0800
X-CSE-ConnectionGUID: C4NGBJ3gSE+TyYdAbXwqhw==
X-CSE-MsgGUID: SWVY34l4TaqlBZqkBXOFIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206618265"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 03:56:25 -0800
Date: Thu, 22 Jan 2026 13:56:23 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: development-process: add notice on testing
Message-ID: <aXIQZ0cI_4GF5d_t@smile.fi.intel.com>
References: <20260122111525.1112145-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122111525.1112145-1-dmantipov@yandex.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jan 22, 2026 at 02:15:25PM +0300, Dmitry Antipov wrote:
> Add testing notice to "Before creating patches" section.

Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Thanks!

I may confirm that lib/ is indeed a hotspot for treewide users and breaking
anything in lib/ almost always break at least a couple of users sometimes in
unexpected places. That's why the test cases are mandatory for a new feature
that will be reside in lib/.

> --- a/Documentation/process/5.Posting.rst
> +++ b/Documentation/process/5.Posting.rst

>   - Test the code to the extent that you can.  Make use of the kernel's
>     debugging tools, ensure that the kernel will build with all reasonable
>     combinations of configuration options, use cross-compilers to build for
> -   different architectures, etc.
> +   different architectures, etc. Add tests, likely using an existing
> +   testing frameworks like KUnit, and include them as a separate member
> +   of your series (see the next section on what about the series is).
> +   Note that this may be mandatory when affecting some subsystems. For
> +   example, library functions (resides under lib/) are extensively used
> +   almost everywhere and expected to be tested appropriately.

-- 
With Best Regards,
Andy Shevchenko


