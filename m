Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ADF30AD0A
	for <workflows@vger.kernel.org>; Thu, 23 Oct 2025 13:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227101; cv=none; b=QwxdZ3kbDpb3Ab1it9qEkaT5lpN21zRcu6iw3dwfcxsHQS6IfKL2U+KCp7Hv2Rglevz5oEh3Ypg4eokNLKaxKPFxd5ZenXwYM0WdpYy37V9e5DUCRGomGScKGC+PfeDVZyFJ60hF5ZxLkP1wQJR3E0/oaHNHceGHi7KPqZhd/4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227101; c=relaxed/simple;
	bh=fQGPL2wAp1su4DsErlG30e9PExo6Wj5zg3lLPe3cQYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owRvATkRS/3wJMjRO/A9d37f3fmXAwiVcLD8JprQYVFcSa5R4fYfMXemu6dY2FnAr6Vjrx/vX6rRXzVN8xDpLPsheilWNfvHXO96NY3+yiM1nntd5sc5q/hlC5Skuxzev/AEZ2S9HRkA0an73QePvhv9wahF5mxDiIA7CDegbiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bPUQUojb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bPUQUojb"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-474975af41dso6020925e9.2
        for <workflows@vger.kernel.org>; Thu, 23 Oct 2025 06:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761227098; x=1761831898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FZkEHZ6BvBqCRscatYxdEEZ9hCJa4XN3mU8tPMYldOM=;
        b=bPUQUojbqNMf+pd7a8jp0Iq5T1YdHmEWH65BHLUcoEKzV/ZEkYDhNCobgUJiVSU8LR
         hgIWgmPhJl4MpavoNKM7F+CxJNMDwpXQM8eZGR54YQAwwagoWvczqahdH/C082JPEZz3
         4Ks3QKiSabs3FPt817A3TtXWuLokBL957krRxWAvhQieiJy57vGWleyQrrfomxoVrVNY
         1cXh0+a7aCH0RPiOByzke4Hi6CFS92NkzDEKufP4YcA4aGFUiOQiNPAC/EyEkJMmILDS
         KOxJnAlhijLvQ/tYql3+eXk8odU6vJsVc/DolSnH0LrnDnRYzQG+J/eTq8SaVd6ojM9S
         2WuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227098; x=1761831898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZkEHZ6BvBqCRscatYxdEEZ9hCJa4XN3mU8tPMYldOM=;
        b=wGZeewA5AefbGnbRAm6inBz9o5HiRzF/LTJZmK3hro4raJHlseLnhMzMfW7uWgG1JH
         j34alJCkV715/zDIg+F1vSi6bcZJYR1qBVBSnbpD4Qiphf2tkwL7ylhb67Nj4hdF1EZ2
         H7zZnIo/i4xOpx5TH4xidr/h9owImL78ACwErtsmRvlkk7LDeLlU9mi2lgpsujRAZIan
         4EBKof0jOCNJbvwljJ1CxlrppdYJelBCsv1U1scU5OBY8pi44hgV2FbYVk11Knv04yLp
         crdbSMeFlHRdhWuIj6S7WoCsBAxvSFRNhGfg2WYvFeNfOc8UWwEZEGJhceVa2ooSD4f7
         1a8g==
X-Forwarded-Encrypted: i=1; AJvYcCUWy2lFcOq/mbtAgy3Hzl3kaFSakhN5hBxLa3Y7tp2G4lSYRXlLPk/X/MDUDi94j9ruMLNvRwvn67o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp4Wlc25NwuEHqmXIE7euC+C5E4MuRwF29Iokarej9g+BQB9a5
	tGnGK1vM5cbCG2iePEVRkz0yKzzsgOnZU8zj9jk+fgU/yzYpwof7FA59XJW+GiT6ePQ=
X-Gm-Gg: ASbGncs2EaiQEpoVAORSCo+/M0AnGkK600cvNhHzPGAqq4p9HTA9plcrLJ8GHIOaJr7
	JgsbGlUubtAzGlGpVpddUCXvVzwWqbOksseomkc+Ku2CXcqhP1ope+zU3xrBnUQCKE/hnbDhcUj
	FSQlIMyN7eSClS/ndmywwKe5+7myD7KziWN1jGoHDalf+MJ+TU0LKGkxFbMdqLmUo0NZCxvDziy
	kNqulfG0LkoqeVMemfKB6Dgm2uQsXLxqXTZ7rLCOHQwovpRqZCX7z3w+zKdrFqdp1JDl+HnEREz
	90/Vkbj9wEwzPCiQ6ZA0jGT5LQNuPha4hYlOB4vpgMQSYOvjtDrquM1o8s19KUFrSMG1dQBJn+O
	JSG8kAqEYfQHXzIubTVYQXfiP2SsQZPC5sEurYcrxDY/K9W+R930GijDTEdciPvc7kqXfteVcg+
	zDS8nsN5NZZOkykHVJ4uzhu2eoQ3Q=
X-Google-Smtp-Source: AGHT+IGPd+brTs/tr9uigSHWLaHZFIfinUl3f0FWfAgHyxWRy8RvOdRx08VMDoZTA6McwENXy6a00w==
X-Received: by 2002:a05:600c:458b:b0:46e:39da:1195 with SMTP id 5b1f17b1804b1-471178784d9mr183926935e9.3.1761227098250;
        Thu, 23 Oct 2025 06:44:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475caf152absm46879295e9.9.2025.10.23.06.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:44:57 -0700 (PDT)
Date: Thu, 23 Oct 2025 16:44:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: dan.j.williams@intel.com
Cc: Ally Heev <allyheev@gmail.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Andy Whitcroft <apw@canonical.com>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Hunter <david.hunter.linux@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] checkpatch: add uninitialized pointer with __free
 attribute check
Message-ID: <aPoxVqxevopRpPu1@stanley.mountain>
References: <20251021-aheev-checkpatch-uninitialized-free-v1-1-18fb01bc6a7a@gmail.com>
 <68f7b830ec21a_10e910070@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68f7b830ec21a_10e910070@dwillia2-mobl4.notmuch>

On Tue, Oct 21, 2025 at 09:43:28AM -0700, dan.j.williams@intel.com wrote:
> I would go futher and suggest that the pattern of:
> 
> 	type foo __free(free_foo) = NULL;
> 
> ...be made into a warning because that easily leads to situations where
> declaration order is out of sync with allocation order. I.e. can be made
> technically correct, but at a level of cleverness that undermines the
> benefit.

To be honest, I'm not sure what you're saying here...

I have written code like this.  There are 515 places which use this
format.  I think it would be a controversial change.

$ git grep __free | grep "= NULL"  | wc -l
515

regards,
dan carpenter

