Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82696254B03
	for <workflows@vger.kernel.org>; Sat, 25 Oct 2025 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761373754; cv=none; b=RGSUdBMN3yh8ACyG8obSnAHwktRZSIlsLI+40cighjEUHOYFdHtru0w5XPwAWh49sBqPRsKNG9e8k8Dqafl1XiJdbZpmIyLXoqtTFcZeNdzW+TvBQIWtBUHrkk8ctzyf7jcJEbrR1BEMzN5NNZ7QVmapBSJymWs/ave6yRhqO6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761373754; c=relaxed/simple;
	bh=ujGGd/a7ODVUfmCS2kG83LM8Y1iCgHMqzkGVaDz6NNA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q9rTJHHd0prsh1ZS+EHfko5xSU6Paa96yxtzZk0gtEq0Lu/hnJEyu6RZsyQIF3W5wt3H4FLcVTPQ30b1zrcGkEDxepb8VA99QzfJYILjIIbt2mgvZZegtevbwUQPzf32KMIky7Q5GhEgdfyAwT/UqWqKVpwILrnW4QB2j/7aQ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTWlzsEm; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTWlzsEm"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7a26ea3bf76so3844436b3a.2
        for <workflows@vger.kernel.org>; Fri, 24 Oct 2025 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761373753; x=1761978553; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ujGGd/a7ODVUfmCS2kG83LM8Y1iCgHMqzkGVaDz6NNA=;
        b=dTWlzsEm1l2G9adWWl3xBc7R3/a6QZRPzPRzfVNA3Az+VXjrOkqXkLctfH4bW1fo4w
         k9at0EvHSm9ekagkY79nm3/HK5/m5aTsHeR8zaj6PmiMF0Ve4Z3khG7o/dwOzPOyZJ6z
         9ZujqRNxRMXepJ11jGfIwMpcNDIeWYsKIVJYOGEQssG4uJZL51sxd4/OhdZhiruQc+d4
         Ve2HsMh6EO1WvBkr1H9YFRb/noihuCdlHGwxAZmUWkCo9dpUTZYAhxgXB5BzAtlRkS9U
         3GNSuNyIHFuyCKfemUKfh905RuFeNuVAHzZclkhYHWMG96DHdPp7STfc5KfL9VkemTwv
         THGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761373753; x=1761978553;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ujGGd/a7ODVUfmCS2kG83LM8Y1iCgHMqzkGVaDz6NNA=;
        b=Z06EfNBXFMVdZB82hQMnNiXtOj0DKJ4EVyix3Cgt2nRQ1n/g3mBFP9MAyos55oikXy
         5rw/fqEsAlF0eKdA3GvjXpgxdOOqyYD9EV61MMrh3MQjUKSns6p+T0Tmy089P+R6UdpC
         soCj/nq14rh9TzbDt06ZP5/TNIwoNMExrBSxGKX2u931/H/WmkN04l5Ib1obepVgUw4E
         o7FzljPBcSUPw7YWyS2NW9cyST34/d6iDzNVvcRZ0yty381BHOHDbdFqBh/IeX/kUSTQ
         GMAWLBviGR99OpJv5ek8y7jXYk1kbCN5O6zLGxPHznNgTYwrDl83w7KvOSytZCabyhkn
         vIYQ==
X-Gm-Message-State: AOJu0YwddcwXyKF62xnGiGjxpHj3NvFX2duC9jqSUBfE2wMj8TSPkh7b
	8yyRTQsw6uKRsfzBOugzgzJUB1ZuJklZqpd0CD9CYW6fBMqny5Yh5pNo
X-Gm-Gg: ASbGnctTmI/U2qDX3qwrQgzfL4UQL1btvD4v/uL3hJ2lBvy1Sk3yrojUlI5xrKmN+nN
	ZLtdSRC8oUwqeRLQgqFJiZMPupXQ9XHq7hL7WL9Vi3LstGSJh6QmttC4pKEbNQFad1nX9MqUIQs
	SnkCYuW8RKV2sqtSOSX232xXdj293gWoqynEWVOSTTK3kLa2U7QEvYcocppwkrA5aBDXWICWavL
	79hdwW509nAB7+LYFKUtDov0hfaHdc44w/6ZqVc5DP6blWbBwyjHFAZAIBnjsGxisdgPA9JDbch
	8fFjsiC8/uCxGid5I3qI4LP8Axxpoye50gwQyzTLZsvocj7ddu4DJZIfJxaRjTZwwvv4qN4d54Q
	oCumzw0duCdD6itVjUQAdGvH3rkl/pXZxyMmrj/KHEPqLDGF2d7sA2v2Uv5flPfk5i/tMWIswCw
	eslrg9/iuPIwymPTWpD1rrrl5xrb8eigE2lzpxtu/jWAg61AA9TlFTRWzs
X-Google-Smtp-Source: AGHT+IFWUEUqUpK9BOM5WuZByjx+FKXT3VLhONWJFmh5THmG3nVw5cQe7vhxVbZm9c/e9p2ROCfQ7w==
X-Received: by 2002:a05:6a00:cd4:b0:7a2:7d0d:80d5 with SMTP id d2e1a72fcca58-7a28680406amr5047434b3a.16.1761373752751;
        Fri, 24 Oct 2025 23:29:12 -0700 (PDT)
Received: from ?IPv6:2401:4900:88f6:d7b0:443:a828:b6ba:688d? ([2401:4900:88f6:d7b0:443:a828:b6ba:688d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049f47sm1181005b3a.31.2025.10.24.23.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 23:29:12 -0700 (PDT)
Message-ID: <403df2fefa9b6f83f805de3da37c18c7d6ef661f.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] add check for pointers with __free attribute
 initialized to NULL
From: ally heev <allyheev@gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
	 <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, Jonathan Corbet
	 <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
 David Hunter <david.hunter.linux@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Viresh Kumar	 <vireshk@kernel.org>, Nishanth
 Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,  linux-pm
 <linux-pm@vger.kernel.org>, dan.j.williams@intel.com
Date: Sat, 25 Oct 2025 11:59:05 +0530
In-Reply-To: <20251024-aheev-checkpatch-uninitialized-free-v2-2-16c0900e8130@gmail.com>
References: 
	<20251024-aheev-checkpatch-uninitialized-free-v2-0-16c0900e8130@gmail.com>
	 <20251024-aheev-checkpatch-uninitialized-free-v2-2-16c0900e8130@gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Based on the comments. I will drop this patch in next version
