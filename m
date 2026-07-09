Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C20D280CF6
	for <workflows@vger.kernel.org>; Thu,  9 Jul 2026 13:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603501; cv=none; b=Dt32ZgK7QnASqi6UMNPj2/2iZ1eMNI4k8dIeMhyW2lnDpHwZ0QD+AIV8L9AmJcyScqk2IGlvp/LiBrVXzdgHOERUgzSuRQalDDg8ijlzFq9NvKgkCJHT0ZewQSZGecpAcRmvzSKwq2rttQ96kHpBcYSvj+UmMH04sQq1Ncb9jwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603501; c=relaxed/simple;
	bh=7ISU5xPOy74bICjanRZFVU/MoFoShesRb4zQUg2TqBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C7wlv5qKFZG8jVXsi/TsgQKkGRrynHkxfWhS9hifVGuIgApNGq5CJ2OtZ8hl9wXElltqkDsnykZnz6/Jc7ETZQKFPC9rNMCds2dWbVudjUyzEBRLdM/hllfzI0nHacM4V68cMlQH6/VrQWFq3rfCBQKlOWXsTA9yVZShLX2pWEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Wzua9qWw; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Wzua9qWw"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso1122852f8f.3
        for <workflows@vger.kernel.org>; Thu, 09 Jul 2026 06:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783603498; x=1784208298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+2+l0R7RX9cCzxaoR4qreoVsEJbp9qB9SwPbos71OM=;
        b=Wzua9qWwbN16wpcMUQD2HQzqjaIDt6s5Xiotl7GUM94PxCcWlXR4WcgNkvzvyR9DIw
         hBSyh/HJq7PwgDGmo/yy/Mvfoty27OK7ID/UU+ZnthIiD5GWAFLBy08oRXOeiMiQPbJb
         OSriVOtOJB6Aw/BO9ERxVhefDLYl2A0tXehA08EaZYT9NLREIBQQJMVQvm7f8ZqRf+jS
         j0frJ8WDFLUS8d13Vov48HJF0Hvr8Bv/kx3hKo16I+L6ke/ZLQjcPCkicGV0JiKerxWL
         hiVVKxlyudOBr2gcfKTV+72TpMSBrQdoSsTWD2fFF2O6oU+o9M11FoEpVIHzZ/aC8SoQ
         4Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603498; x=1784208298;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+2+l0R7RX9cCzxaoR4qreoVsEJbp9qB9SwPbos71OM=;
        b=B2QMG4neSxlPhUSvQXIYAjiLjvibgaYFz6mHYm2wZzMcCKAWpuGKKLsYFzfaSP3Xly
         88mJVEjSOB6OQCPgUjiLcG+ztnU2BvhBxP3BhJD1Vh3+zZQ01uh9r5qZQyeAqrvi6ZKZ
         Mvzw4S1JmlshREswu7IKlrzZ2RkBLER2ncU0R6vfX1mGV+Cxy26LE7XnfYoZm/Gp6v3Q
         6tccsHvV7RdvVfHqvOgc8Svf0ECSLIEaxZe4fR4DYIOe1fXvSqzgaKhb0nKReMZ6fGJd
         FZ8o3LXo+YRNlqI5hz3MFYTh6u5jxFuEPk4jzIxLE6iWcMcC25rPHlBRzqQSk4L5rtZv
         LKNA==
X-Forwarded-Encrypted: i=1; AHgh+RphVNLD9XAelgJTGggK2XO05eNl6DEBZudTx31kOhKQTjGlLSjrXagMJIuRwv6HyBpbnYSGIxPXz/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYsTSxdo56jVmAMkRFbZ6NwID4kdyg4gNMa1kCxqRcKUHf0xnd
	wBMEmHG8zdn14D0577SFCA3PWv3vH+6r5lo0JFmv7BdlRZ0vT8RQB9p7LsrQEkPzIjQ=
X-Gm-Gg: AfdE7cmXya0XLVwzeneDNtGWlo1XiHKRwIj4ifOB4zJsZiZKxlf9faU3nItNhYtLRwx
	d583Z5ax705BbGY1YKUdVsDa+sasfF8uDvT1Dn4m6HGDEOjUjSPFkAbinoDeODCVDRPF8wseXGk
	GS19P8ynJguH7CgOFkP0yyILAou2vDxVqiOJfOYsfIDlknHrKfHqVM9wR+tOBZc6y3RpbY3JkHt
	nQoIsIBHLuCq4AgOwCKNCkB7SaAtoVQJAKRHB3WqZHs6UhLStGxSpPzBlLQDAPikF3tDi+XB77+
	PGyJFUBt603D6M20QXSLs8lbhRyyEH/bcSisUVp77L5PeFK5IqxYs1sxkZsFPEX2XrBZnTfICnH
	1eNOF6LGN5T83jX1DXp8F3HemxsEQuHmq+fBM5AsWEWg1lNCSXpFDtpoHdDG84KgJUghXk56eSM
	63n15hoUNjeRvDKEVwL+kSGPu9ZpxQESICV9quYq7RpWZl
X-Received: by 2002:a05:6000:2013:b0:46e:624e:3c2f with SMTP id ffacd0b85a97d-47df077b2e6mr7512557f8f.47.1783603497728;
        Thu, 09 Jul 2026 06:24:57 -0700 (PDT)
Received: from [192.168.42.79] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm47212857f8f.31.2026.07.09.06.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:24:57 -0700 (PDT)
Message-ID: <84ded2aa-397f-465b-b2e5-d2fa31fc807d@suse.com>
Date: Thu, 9 Jul 2026 15:24:54 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/26] meminspect: Add debug kinfo compatible driver
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de,
 andersson@kernel.org, chrisl@kernel.org, cl@gentwo.org, conor+dt@kernel.org,
 david@kernel.org, dennis@kernel.org, devicetree@vger.kernel.org,
 ehristev@kernel.org, frederic@kernel.org, mingo@redhat.com,
 jstultz@google.com, corbet@lwn.net, juri.lelli@redhat.com,
 kasong@tencent.com, kees@kernel.org, konradybcio@kernel.org,
 krzk+dt@kernel.org, linux-arch@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org,
 peterz@infradead.org, pmladek@suse.com, robh@kernel.org,
 saravanak@kernel.org, tj@kernel.org, tglx@kernel.org,
 vincent.guittot@linaro.org, workflows@vger.kernel.org, atomlin@atomlin.com,
 ast@kernel.org, aliceryhl@google.com, linux.amoon@gmail.com,
 ardb@kernel.org, baoquan.he@linux.dev, baohua@kernel.org,
 bsegall@google.com, jackmanb@google.com, leitao@debian.org,
 brauner@kernel.org, coxu@redhat.com, dietmar.eggemann@arm.com,
 dianders@chromium.org, ebiggers@kernel.org, feng.tang@linux.alibaba.com,
 yangfeng@kylinos.cn, gary@garyguo.net, guohanjun@huawei.com, jack@suse.cz,
 wangjinchao600@gmail.com, joel.granados@kernel.org, hannes@cmpxchg.org,
 john.ogness@linutronix.de, jpoimboe@kernel.org, shikemeng@huaweicloud.com,
 kas@kernel.org, kprateek.nayak@amd.com, liam@infradead.org, ljs@kernel.org,
 elver@google.com, mgorman@suse.de, mhocko@suse.com, ojeda@kernel.org,
 rppt@kernel.org, namcao@linutronix.de, nathan@kernel.org, nphamcs@gmail.com,
 n.schier@fritz.com, pasha.tatashin@soleen.com, pnina.feder@mobileye.com,
 rdunlap@infradead.org, rioo.tsukatsukii@gmail.com, senozhatsky@chromium.org,
 skhan@linuxfoundation.org, sboyd@kernel.org, rostedt@goodmis.org,
 surenb@google.com, thomas.weissschuh@linutronix.de, vschneid@redhat.com,
 vbabka@kernel.org, youngjun.park@lge.com, zhengyejian@huaweicloud.com,
 ziy@nvidia.com, Eugen Hristev <eugen.hristev@linaro.org>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708070809.2660886-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260708070809.2660886-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/8/26 9:08 AM, Mukesh Ojha wrote:
> From: Eugen Hristev <eugen.hristev@linaro.org>
> 
> With this driver, the registered regions are copied to a shared memory
> zone at register time. The shared memory zone is supplied via OF. This
> driver will select only regions that are of interest, and keep only
> addresses. The format of the list is Kinfo compatible, with devices like
> Google Pixel phone. The firmware is only interested in some symbols'
> addresses.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
[...]
> diff --git a/kernel/meminspect/kinfo.c b/kernel/meminspect/kinfo.c
> new file mode 100644
> index 000000000000..7451c13bc316
> --- /dev/null
> +++ b/kernel/meminspect/kinfo.c
> @@ -0,0 +1,257 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *
> + * Copyright 2002 Rusty Russell <rusty@rustcorp.com.au> IBM Corporation
> + * Copyright 2021 Google LLC
> + * Copyright 2025 Linaro Ltd. Eugen Hristev <eugen.hristev@linaro.org>
> + */
> +#include <linux/container_of.h>
> +#include <linux/kallsyms.h>
> +#include <linux/meminspect.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/utsname.h>
> +
> +#define BUILD_INFO_LEN		256
> +#define DEBUG_KINFO_MAGIC	0xcceeddff
> +
> +/*
> + * Header structure must be byte-packed, since the table is provided to
> + * bootloader.
> + */
> +struct kernel_info {
> +	/* For kallsyms */
> +	u8 enabled_all;
> +	u8 enabled_base_relative;
> +	u8 enabled_absolute_percpu;
> +	u8 enabled_cfi_clang;
> +	u32 num_syms;
> +	u16 name_len;
> +	u16 bit_per_long;
> +	u16 module_name_len;
> +	u16 symbol_len;
> +	u64 _relative_pa;
> +	u64 _text_pa;
> +	u64 _stext_pa;
> +	u64 _etext_pa;
> +	u64 _sinittext_pa;
> +	u64 _einittext_pa;
> +	u64 _end_pa;
> +	u64 _offsets_pa;
> +	u64 _names_pa;
> +	u64 _token_table_pa;
> +	u64 _token_index_pa;
> +	u64 _markers_pa;
> +	u64 _seqs_of_names_pa;
> +
> +	/* For frame pointer */
> +	u32 thread_size;
> +
> +	/* For virt_to_phys */
> +	u64 swapper_pg_dir_pa;
> +
> +	/* For linux banner */
> +	u8 last_uts_release[__NEW_UTS_LEN];
> +
> +	/* For module kallsyms */
> +	u32 enabled_modules_tree_lookup;
> +	u32 mod_mem_offset;
> +	u32 mod_kallsyms_offset;
> +} __packed;

Is this kinfo format documented anywhere? I was only able to find
a reference to the equivalent downstream Android driver [1] in the cover
letter. However, I don't quite understand what it is or what the
associated bootloader component does with this information. In
particular, I'm unclear about the purpose of the following
module-related fields:

module_name_len
enabled_modules_tree_lookup
mod_mem_offset
mod_kallsyms_offset

These appear to be exposed for reading the internals of the module
loader. Be aware that this data is not stable.

[1] https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/android/debug_kinfo.c

-- 
Thanks,
Petr
