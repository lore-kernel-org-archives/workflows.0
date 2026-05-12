Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DCF3932D8;
	Tue, 12 May 2026 08:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575944; cv=none; b=JpUsZ97FWlwyQAXhLlO2fq+bmTyP14jR0Dtt371yaCJ2lA8noKJZcoQTf0D0XRa7Yygw0lh4Z3+VV3P8aiLvsLdiAY690Vb/MHJQXnjAiCLfC7/LNL17qE8k7SeQEDLbKeq1hxRegg3RPYHihh1UT56CYpLNJWR89wFPkNyogrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575944; c=relaxed/simple;
	bh=BCrJOeW+G/hzkswZS9tEKFKdYNeDtOku1udseLK8q/4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QMHKo4+GbqWZE/AaoSJOke1qkx7azyAnSmtf63O/fB+7p0MegG+snQ3uI3aDmt55ZBjUXismANk3LnK4xrxkBtXWBgYgk7TzWlJGLdKq3u4efBy5hp4Qzz0gbbkf9tKkMiRSGGnmUM94sJNw6ZR7zB51l9uNM7f//9RX5nUv5wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=boMrmV8N; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="boMrmV8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778575937; x=1810111937;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=BCrJOeW+G/hzkswZS9tEKFKdYNeDtOku1udseLK8q/4=;
  b=boMrmV8NU5BaKy5u3pf6YCYjIVoM/PSKKguNmBB3LDoSxjDDT3b83TmG
   YU6/lR3ttGXNZ+ubJ6NT/0Pf59WxPpaUciX26lmBxUlwzWCmt38gX8sbO
   3CH9Il/PMS53kBx94xXjXKkV9wtDDKjRzAuA8SqLrtsEKqyL0xgmb70Tf
   P+ItC6keCnkLb1JbgNDyYYqojf2R93ejvEU98iTKjsU33Vv5g/V2gwnxf
   JAl2TZ3DFlwv25Y/OiDNHtL5MCtJn+DzXRY2cqJkTq5KiKUWZ3ZbX1yYV
   E2Xh24vknIDQB90nVIeUxNkutvkN6tmdiXVzHyOQow4KN/TELi5mLRMae
   w==;
X-CSE-ConnectionGUID: UaZbDyTtR8CkRmF0/3e2ow==
X-CSE-MsgGUID: 0XMUP6FWQteANDrQD3ycDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90579647"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="90579647"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 01:52:11 -0700
X-CSE-ConnectionGUID: 0eQ/XthhQ4+Io0O/lG9F1Q==
X-CSE-MsgGUID: rmp/zjQ2Q8WNnbKtf6yRAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="239541384"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.158])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 01:52:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Manuel Ebner <manuelebner@mailbox.org>, manuelebner@mailbox.org
Cc: andy.shevchenko@gmail.com, apw@canonical.com, corbet@lwn.net,
 dwaipayanray1@gmail.com, joe@perches.com, kees@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 workflows@vger.kernel.org
Subject: Re: [PATCH 1/2] Doc: deprecated.rst: add strlcat()
In-Reply-To: <20260510165451.57674-2-manuelebner@mailbox.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260510164907.57176-2-manuelebner@mailbox.org>
 <20260510165451.57674-2-manuelebner@mailbox.org>
Date: Tue, 12 May 2026 11:52:05 +0300
Message-ID: <748c2c3d549740918e14f29aa25dd475b99c1313@intel.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, 10 May 2026, Manuel Ebner <manuelebner@mailbox.org> wrote:
> add strlcat and alternatives

You'd think it's the strlcat() definition that needs a comment above it
saying it's deprecated. I don't think folks really look at
deprecated.rst.

BR,
Jani.

>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/process/deprecated.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index fed56864d036..b8a65c19796c 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -162,6 +162,12 @@ if a source string is not NUL-terminated. The safe replacement is strscpy(),
>  though care must be given to any cases where the return value of strlcpy()
>  is used, since strscpy() will return negative errno values when it truncates.
>  
> +strlcat()
> +---------
> +strlcat() must re-scan the destination string from the beginning on each
> +call (O(n^2) behavior). Alternatives are seq_buf_puts(), seq_buf_printf(),
> +snprintf() and scnprintf()
> +
>  %p format specifier
>  -------------------
>  Traditionally, using "%p" in format strings would lead to regular address

-- 
Jani Nikula, Intel
