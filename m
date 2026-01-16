Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0498433C19C
	for <workflows@vger.kernel.org>; Fri, 16 Jan 2026 17:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768583773; cv=none; b=VEJnQWPLcaFdYDvPfcT1HGl4e9+BzrnoPNFLVcU4HYcHRQRjxsZHnA7wYtNozr65U/qWnOVjSIfWZXlmXQsOfZX1jEfVsBZrkHhFWGV5JaI76LuHi4N0dtZrYSneI4AWPpv6jZGht0Zch5+dx/I2EzjpDDgT51H6kjpqAcu69zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768583773; c=relaxed/simple;
	bh=0HukBWkzWF4xfMna97oVTMuTQacjQzaYvagieCOdmqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KT7356HDRUd9AudsLC4S1xAgJkwJKZUdZZT7Al7WsNK8WBpjbXjJiOV4XqboiuvlLMPjKb32QDezPxqhiYeNyr26jp2RaDVGgoJq7B847zzxmVVdGjQ9ZKmqXISmOckSz3CjLoShQMI0oVl6MGeecowrhYWGdNmseZDUS+1ipfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGnCjbUm; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGnCjbUm"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0c09bb78cso17129655ad.0
        for <workflows@vger.kernel.org>; Fri, 16 Jan 2026 09:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768583771; x=1769188571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HukBWkzWF4xfMna97oVTMuTQacjQzaYvagieCOdmqA=;
        b=IGnCjbUmV5eQsLNtDqTDFEreU9QOfihBhTL+i5J0wM6pyNs082CrretcvjuKgZOs+6
         TpcRGJzW0OgHSMnJmhC4xtGUuvfFa2IziCAunc6QisPZ3Jm3PR3SXQvMtkxW/ITgCNO+
         3A7fYpJEjaeBTpL80to6Jl+0G1DqLhIyae6oq9GV3AYlg4ItyCRaE6LjNnN60h0NgvSw
         o9cbVkNdpbJFpbdNwqiaMmJqpFuUNt1JWQ9wbd8BiVWsZhF1zTyg3PcEHHvZjtx74d7/
         1qehiZIxDdEZ0Hzw4ACCHaRIhVw76WbSAeOkgkeMhro4vGtW7hYvjT47l/JoWZsb6agZ
         ckGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768583771; x=1769188571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HukBWkzWF4xfMna97oVTMuTQacjQzaYvagieCOdmqA=;
        b=IgF4DkZ5awXUc8d6ErjGkjPnsfk9Av7HuBDOieQQhWJeHwqMbWKavrEfS4EuSyGSEt
         U7zhkBF4qX7STpB55eKK7W+CVWzlC87L9oZ9+h+JOrWGpGUboAjZfDW0vHX5N9Wfkpf6
         YNe0p93sUN8VZ1aiiAhqKBArfJUfrkKrnkEnNCni27WQ9altXF9oYKOzr4WznQ+fNqR2
         hWXtoWMjZsJXxg3ueQ8J6kJSM0vVz7F3WJu8yJfp1ZSlj+vmR9K9q1wZfyeDAVBEWqk8
         kBeY9pfH6Il3MmYC4MAybXeEuFRCehITe4ybtIISzEPhLuTklqjrMcLrFIs1GWXZzn2k
         zB4w==
X-Forwarded-Encrypted: i=1; AJvYcCXEsklakY2wn15/VhLUx8mKnHMbY40fyKTFLav1ukNxTy2tGwNVkdzFKfgxvrlmq5w9YGn3PII2/3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEv3GJPG94PJVMo8hCfQ62wverxCeMUbULtM2bEipFXzPFMuxT
	WOWNHDXVF8K/3A+Rx1e2vLIUmA6S6E4UdkZoLccEqWDgvlrKAsonNnoXXIj9WKMf
X-Gm-Gg: AY/fxX6Xf/2RrxEisTMl5OHZVRn6x6UUIjBS61Nnb64BErCz58cZ6FFo84ih2Zkmw5W
	C1QeK3+/lJMgpWN26wr9uWYHAWna7jZhKY0ydT841X+BMZxKS4brQ66eY01LOH8eRZAtOG/v0EI
	uiGJ7LKfD1BcducZ+JA38gQgOyo9V49mgrvuRpqMYeZBINUatfTYGMzOBVHw6zk09b7ZuzEGSzO
	QwOdF2YMYru/ImgOOO4t12n/7D9Z5nr1gvj2XlyXGkslTDhnU7v81xq5ogALbvzTvueJlWJyNEy
	Ch0waZMXDFZTBMkYyqK0nwo5iuSa4P54YlcJMsX0S3eoCPkOouFJNgZrGetrAg1EOj/n8E3NMir
	vizYca/y4JW/DuhnTOdREPIHUGybjhkuUF9keS3Lb9ZVX9Yob1jkXmj51Jdg5WYJc4sKuxKMf53
	/gZMKi7N4=
X-Received: by 2002:a17:903:2407:b0:2a0:a05d:d4a2 with SMTP id d9443c01a7336-2a700a37c8bmr65178465ad.23.1768583771236;
        Fri, 16 Jan 2026 09:16:11 -0800 (PST)
Received: from fedora ([210.228.119.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dc83dsm26270535ad.50.2026.01.16.09.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 09:16:10 -0800 (PST)
Date: Sat, 17 Jan 2026 02:16:04 +0900
From: Ryota Sakamoto <sakamo.ryota@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] kunit: add bash completion
Message-ID: <aWpuYs0Mw6fR4rLO@fedora>
References: <20260115-kunit-completion-v1-1-4de6564962c4@gmail.com>
 <44b770121202e9f41648da5abaf9a87d5b8811c6@intel.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44b770121202e9f41648da5abaf9a87d5b8811c6@intel.com>

Hi Jani,
Thank you for the suggestion regarding shtab.

On Fri, Jan 16, 2026 at 12:10:27PM +0200, Jani Nikula wrote:
> The alternative would be to make the tool more friendly to existing
> completion tools such as shtab [1]. Since the kernel as a project is
> really averse to adding external dependencies, you could take shtab's
> CLI approach, and commit the completion script in the repo. Only
> whoever's updating the completions would have to install and run shtab.

I understand your point about avoiding homebrew solutions, however, a main
benefit of this approach is that the completion script does not need to be
regenerated or updated manually.

Using shtab would introduce a new dependency and maintenance where the
static completion script could easily get out of sync.

So I would like to proceed with the current approach.

> And the whole thing could be taken a step further, adding, say,
> tools/completions/{bash,zsh,tcsh,...} directories for all the kernel
> tool completions instead of spreading them around.

I agree that centralizing completions is a good idea. So it would be better
handled as a separate future effort because it is a tree-wide
reorganization.

Regards,
Ryota Sakamoto
