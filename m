Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB13223DC6
	for <workflows@vger.kernel.org>; Tue, 30 Sep 2025 08:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759221225; cv=none; b=dyrVBNHL+HFdwWvdtT3GYie3Ol6bXf5ZuTx9MvcyqozCe5ePJFQBOWb4GM1sOmlcOm2/rrpp0PFyMhRM6Ly6EmAQ+J287ZUVStUMG7aB5/6MU8eD14PCSOxXNIN9g//igaTIuOvwlhZQ+k3wHXmWnMsrIC3MF1bXlhBR2QSuD6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759221225; c=relaxed/simple;
	bh=b84z4sLj6OipiU/LDADQxD4tH4RaTd5fv3amUZ6N038=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=makm+9y1VmfIUg5U9ypPx1t5Md5F65/473SJveCHN5JnexCJ0inYLCXiLgS0UKadgxPCHuIxLzXkLpnF3+wzBiewZlz/GVro4spv93xER34TgdiuMZNlRLuK58QY0907TrVfJi3IZMudDYp2XjD1WyWZ2I6oEV3uCAwvUJHfAFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jH0BfA7p; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jH0BfA7p"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6352a77add0so4844578d50.1
        for <workflows@vger.kernel.org>; Tue, 30 Sep 2025 01:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759221223; x=1759826023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bBOPU6N+QlAarzu9LlqnD6xE/6f1CWCmb96507SlQ5Q=;
        b=jH0BfA7pDo+pX7Z+tkcD8+wAy9cVudilMudXZukkQ2bgWYdPTHjDwiE0aFeVDWeXuy
         OsIfUnhzVXpL+wZUYsn6bTKdYAOJOrH5b/TP4fGJWmcL/URvY1RxlixYIKxAd0dz+JmJ
         V/svmB8CJAtAnFGFxcdoo9SEJLdW5eyTaPqP+yCEuweVPs+ZvXGrMJLDfYvj1WsqiT8P
         X6Vf1esS5qkzi7kgvV5OFGboqEyVQImNjLMIk1EojLiJl2DOjpvXo44WbXdgPL9d9I67
         REA9W9K2suAWQqA4wwMxhUM/JY+/h1M5SKMKB94tZ4FypM5+Xg895Jw0VqQicGHGNwDB
         fmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759221223; x=1759826023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBOPU6N+QlAarzu9LlqnD6xE/6f1CWCmb96507SlQ5Q=;
        b=LAqQZkG4EGHwnF2KS6nGkXcG9MWnFtuhUlLy6GbMUXJAKlWIayyJwZRpmYRWCUlFaD
         3+fx20Ncp7pc4mtW43LECNUYiqQITsX20rc1rgVS0ZPz2ji9aA05ZCC2ljAf3qYAVdTA
         +fQcPPljI+og1gbjxe8hb41HuaW7vyOaofqex1clGujNFiQ4+GWelni9dn31a7KqvrPv
         CNlLyKgWxYlDQm7e/CxaN6T2ch/6BLIyGe9ZBKJfV3f7L252w9GcbuDz6h4CtH7+/gWW
         NlFvbNjDqS1o+fo7L2DIxFD/VlwP2WeaZp8nvtvyMcNoP2SHA97S5UFjMuauB9VGTjYg
         2Zig==
X-Forwarded-Encrypted: i=1; AJvYcCUizt0/fgdld4I5jcux2+jhKuCsGqX5UhgjjDQDOD3otrAfnuFGIleC0SltdJzkKZwEt516kwv+/N0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyErM0vI5t49jhlzUlf/3uwllU56j9GksLX/W2Hjl765xLXbdvk
	1kI0kKc/5ZRkLe3xJVSbBTAB+8tq19smZ9zbrGO9UNwXckA+XokE/rrw
X-Gm-Gg: ASbGncs7ZMKbE7dfVgInJRZyM2yOiGaXyJkckVjQsoobB4efO3bt32FwydCdPsSMF8Q
	nOLPcR6s5dYTLSqBQ3pzYst+e//mzNaTotYcYB8IdO3XRNPaX3OX6l2Aabk2FI0K6P0tSXvsB/w
	gq0C8mAEi4XHmvcfV3E8aS9qbYu2BT5vt1L3g+96ln2FWJGfT97AD4Td9LfKgUboGvRQcMsUpDl
	t8V9pCgK+qGbKiIpStnXcZNeWA3dG2rvXZ7HTftu7YzgChzQUcOKavzWic25uM78pl4oKddGEKx
	B6B15cBpDCltKvIQD7R/P73DkPxVyabwGH/tzQAASa8HeXa6Ll69wjUVXqwfauO9tzs8BmEVs41
	M7s5JofRnrV/Q7jE8YMsT3Czxn+mtB+OejDW2kSj7YamteIT2CCypY3NoaTWmgDY21bIN
X-Google-Smtp-Source: AGHT+IGdR0AHEeCd0GI8ArsMTXFyr2HmyKLRFM1XYpy12MOYMkBlzY/X5jDZtYeuuUkt/8DMB9hqmQ==
X-Received: by 2002:a53:d015:0:b0:635:4ecf:bdd1 with SMTP id 956f58d0204a3-6361a8d4824mr21581008d50.51.1759221222864;
        Tue, 30 Sep 2025 01:33:42 -0700 (PDT)
Received: from [127.0.0.1] ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-636d5b1d875sm3280311d50.10.2025.09.30.01.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 01:33:42 -0700 (PDT)
Message-ID: <7530d25c-f4ef-40bc-9ac8-40de4abe3960@gmail.com>
Date: Tue, 30 Sep 2025 16:33:14 +0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 21/23] tools/ksw: add test script
To: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Alexander Potapenko <glider@google.com>, Randy Dunlap
 <rdunlap@infradead.org>, Marco Elver <elver@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kees Cook <kees@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Rong Xu <xur@google.com>,
 Naveen N Rao <naveen@kernel.org>, David Kaplan <david.kaplan@amd.com>,
 Andrii Nakryiko <andrii@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Nam Cao <namcao@linutronix.de>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com,
 "David S. Miller" <davem@davemloft.net>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-trace-kernel@vger.kernel.org
References: <20250930024402.1043776-1-wangjinchao600@gmail.com>
 <20250930024402.1043776-22-wangjinchao600@gmail.com>
 <3ed8a6a5-9983-4b9e-bae1-4c433568de16@redhat.com>
Content-Language: en-CA
From: Jinchao Wang <wangjinchao600@gmail.com>
In-Reply-To: <3ed8a6a5-9983-4b9e-bae1-4c433568de16@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/25 14:49, David Hildenbrand wrote:
> On 30.09.25 04:43, Jinchao Wang wrote:
>> Provide a shell script to trigger test cases.
>>
>> Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
>> ---
> 
> Do you think there could be a way to convert this into an automated 
> selftests, living in tool/testing/selftests/TBD ?
> 
kstackwatch_test includes 6 cases. Because KStackWatch is aimed at
debugging stack corruption, several of the cases intentionally trigger
kernel panic. kselftest is designed for tests that exit cleanly with a
status code, so these panic cases do not map well to it.

-- 
Jinchao
