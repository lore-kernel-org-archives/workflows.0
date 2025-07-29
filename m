Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AE181749;
	Tue, 29 Jul 2025 10:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753785934; cv=none; b=ub7ZgWCedxO9e4R6ABLxQuaiHMRV7k7ZSKflni2NVXfbCeoCzamrPP6dTULpVIJvXehAxTR+FCwY/qij2nG0Ko//12GH//IEybxU3ggigxhjYMl0/qEuLMvlcxKBSVNHOf7ds3JI+V5nsOMkfxpFj+zdikBHEXswNj2HSBQ0QCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753785934; c=relaxed/simple;
	bh=Y3PBLK+BUsoF3eWxMC0RC/f+tpIEvoQErHZ7YNvX1b8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=REgDGrkV9dFwhVQzoiiZcAZc0a3NE3BaBDXfXWK4D/DPTgbM/ovLvLTLwJfUvUiPgjeJUs+EHL427TU/UjsI0Znld/xKx2uxi1JZSq1Mr/SuEdMbdpnj74Hpems0ZKV0r0vuGdfRcFtPGqkQ7xbDIqP7QcPm9oY57fZJBferF3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJdChDAr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJdChDAr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753785933; x=1785321933;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Y3PBLK+BUsoF3eWxMC0RC/f+tpIEvoQErHZ7YNvX1b8=;
  b=PJdChDArClT0gMeZZBxVXxINdKEMItf0aEgZpTb23v0yoZ7CfmfsDq61
   xIlznX5/afwIO2vJ4GnW799pc3tku0A0q57N/NtJ2eur5ZtiYnucBcyVq
   SiuaS1HYOV1vMJsIsiYQf1/o40/knp7ML3LO0rDtnn6Dpl9EWj8ljyWwH
   vvVi3UYObYRLdH8S+Dp7cjyd0Y+LmJZ5QqY2k/ddM4UC6F+LqVaR0EbBD
   ijEQeYr+r6Rn/fBT6+5CQ29tRlKu2hOLv8WMjsM8r3Qv6HE9C2iXfyR0r
   hgbrNc+4Y31i0BsHlsnKnD/gWehHghCZEIOiBpZiNIGxhx6UNvhGNg6Wn
   Q==;
X-CSE-ConnectionGUID: +r0W6vpeQ2COlZJZCLDC2Q==
X-CSE-MsgGUID: k1P0eSxASBOH1RnB1U528A==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55987846"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="55987846"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 03:45:32 -0700
X-CSE-ConnectionGUID: 3xtFr4UMTXqgJLCl39rKlw==
X-CSE-MsgGUID: LrZuX2M7QeiDJrdd2tbuBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="168076292"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.22])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 03:45:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v2 3/2] docs: changes: better document Python needs
In-Reply-To: <20250728173306.2ab1409a@sal.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1752307866.git.mchehab+huawei@kernel.org>
 <58c0cfb40e600af697b1665ffbc8e5bb3d859bb5.1752309145.git.mchehab+huawei@kernel.org>
 <20250712163155.GA22640@pendragon.ideasonboard.com>
 <20250713002517.7f52b0e9@foz.lan> <875xfhabv0.fsf@trenco.lwn.net>
 <20250724194306.27b98194@foz.lan>
 <83d12d5293e23c622ae390204fed8fd4453014b1@intel.com>
 <20250728173306.2ab1409a@sal.lan>
Date: Tue, 29 Jul 2025 13:45:26 +0300
Message-ID: <fd1372a9fb57a1372db5b3c0992a929f90183f83@intel.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 28 Jul 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> Considering the above, for me it seems that the bus already departed:
> there are several cases where Python is required during build time.

FWIW, if it was up to me, I'd make Python 3+ a non-optional build
dependency. I'd also forget about any Python 2 backward compat stuff.

I would find it very useful for code/header generation during build
time, instead of having to resort to C hostprogs. Similar to what MSM is
doing.

That said, I know there's going to be people vehemently opposed.

> So, adding a "depends on TOOL_PYTHON" doesn't seem to be trivial.

Agreed. Forget about that idea.


BR,
Jani.


-- 
Jani Nikula, Intel
