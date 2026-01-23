Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087D732720D;
	Fri, 23 Jan 2026 10:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769165433; cv=none; b=K8x/FWLPhA2zMbhsUROfBqQSkWAgcPmL52AVqB2peDQRrN5mHNuEc9zLtd+sULxiiNryYh7s59clOHmkotty8ed0uo3yEHrL1vqssZlPi4RhJ83AAdv5eFaYXRg/N0kl44glSrrDZNr9AV/DYFd24KcfMlRXU7VtHjUwm6muLK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769165433; c=relaxed/simple;
	bh=rrM9qmTUBrbLcDbyg77XmUJTtpHjDwog2vE1rLbOTr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AoA/cZlTgXJOa04eRz5wIYIfCs1uoV5UeUZPWBXyeahFui+S0YNHCBgXzEcJwh1ItnTBOTB6iufoTofcl/z03uVL3R8FQKMVXPK/QMt/XokbTPHtY8tx2YnD1f7CKsmXTSg783F8gd6AgM1aYsvd5oRbWhnX1f/fycLVM/PUmW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESDyHXeH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESDyHXeH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769165431; x=1800701431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rrM9qmTUBrbLcDbyg77XmUJTtpHjDwog2vE1rLbOTr0=;
  b=ESDyHXeHJnRl1Mj7InCSNLaIx3HaQU1H+bISHwujueTJ8lT5VTpV5qkX
   wMoB8VPI9inB+75IOt7bL59Ht6iGHXIf4aiQQgpBaMrM7wtHtPt6CIk7Y
   /4Y41VdMO6uThbNJDHl6YYQJFo31h12MBP8KB9++uMtuGc25H0bSnJpOR
   GGweviVC3U8NIgD2KtKGWVyqU6SapEG/2j0pfc6nMQH+sQEtwOtystCmc
   yApKrHHEDg2ZdZk8Rbm5yW/OAX6y2vLVrBW8pjcbi73l64X5W1Me+WQq3
   WfiwyiFlODzs5+64oxZUD8Hr9rdGyOPeTfkrigg8oP7siLWpveDMSjb5x
   A==;
X-CSE-ConnectionGUID: R5FjFWGnSYyVMJjbCUP7KQ==
X-CSE-MsgGUID: wXCpljUnTn+/3osdaHcp6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70319091"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70319091"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 02:50:30 -0800
X-CSE-ConnectionGUID: FoOl+gshRTSiDccD9yXp+A==
X-CSE-MsgGUID: 1c/NY979T2y0TZS8V8zKHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="206817139"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.112])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 02:50:28 -0800
Date: Fri, 23 Jan 2026 12:50:26 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Dmitry Antipov <dmantipov@yandex.ru>, Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] doc: development-process: add notice on testing
Message-ID: <aXNScixKm5L2tQIv@smile.fi.intel.com>
References: <658caf3b-aeb6-49c7-9e5a-1eab175dd1b3@infradead.org>
 <20260123071523.1392729-1-dmantipov@yandex.ru>
 <d9147abf-0b08-40e2-aa49-821c953f5fc7@infradead.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9147abf-0b08-40e2-aa49-821c953f5fc7@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jan 22, 2026 at 11:19:48PM -0800, Randy Dunlap wrote:
> On 1/22/26 11:15 PM, Dmitry Antipov wrote:
> > Add testing notice to "Before creating patches" section.
> > 
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Andy also Acked it. I think you could/should include

s/could// --> should

> his Ack here as well.

Yes. Carrying on the given tags is the author's responsibility.
Otherwise, you should explain clearly why the given tag is not
taking into account.

For this time I do it myself again, but next time don't forget doing that,
please.

Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


