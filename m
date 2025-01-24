Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F108A1CEAC9;
	Fri, 24 Jan 2025 02:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737684753; cv=none; b=OzeIOy58o5RE2hg90cZ5oYNsM+zPx7jUM9gvq3Q+ybtvZe0/KIt+hiygjHVOnUOULmobFytEL821ihQxsYuNsyzo7ds9GfTqzp2LHAsr9Rk8uSo1D4wb65QMnLJieC+8cVGZHc7pcS/Ek6SygIFi6/0rau1mqQMdGSX/7ILdOuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737684753; c=relaxed/simple;
	bh=ZVWsL5TzIlssbUAp6wHsmMyTAmfxKSHrFnKGbtmAIBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxkjAWyrVIv/mgfdcQsCQKNVPXDA427UxR7vN5skMm7PLKNtVSMHxWa8RWP5KnYCkQEKc3GoeZf4otYNZ7gPyXOx4nfdv1reFKwwRmT4x1TZ2aMT+JkgvGZCtwEou3YjMzwMiJqtBEXhFCll/U68RZrFwCQ9skbioXKXjYgBMmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OG8hqtoH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OG8hqtoH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737684752; x=1769220752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZVWsL5TzIlssbUAp6wHsmMyTAmfxKSHrFnKGbtmAIBQ=;
  b=OG8hqtoH3g6HxD/G+haygLSszt0FIMs1fjge9NAIYMUP2fvcRwAmS6v+
   VCvYZ0S1T/YK9/szlSwzgGcXVWADrd2r6OjZDvMsMWptKnu/vIp1mtAc/
   v5uZLUX2820Dkdxb9ALlSAPivpxbP6lxqslXWo66MHYvAdq0IGPi9yKfO
   RzG/gLkBT6SkTFz7ysEgfqAlk72uotWaGOYvfdouQNE5qII3sPzf0OkwP
   wB67HoUUhXjkghGgj3n51eF3xd5FLspe7W9BUYe/Dc27ERvCkWk1zFBgD
   0HAFcQJgEjchKsiAmrZzn33W0JyAO9z9+8kynXfV0o+VK8AwygTKn4+/h
   A==;
X-CSE-ConnectionGUID: TDbIZCI+T565UzqEdobb6A==
X-CSE-MsgGUID: OZA6J/xxQuG0C5FKCpnNaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48875993"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="48875993"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 18:12:31 -0800
X-CSE-ConnectionGUID: nXYMOnQESfGam5t5ZaclGw==
X-CSE-MsgGUID: 6JPi4DtnRJujUu4v4yIVnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="107645960"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jan 2025 18:12:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb9BI-000c19-0j;
	Fri, 24 Jan 2025 02:12:24 +0000
Date: Fri, 24 Jan 2025 10:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiao, Joey" <quic_jiangenj@quicinc.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Subject: Re: [PATCH 4/7] kcov: introduce new kcov KCOV_TRACE_UNIQ_CMP mode
Message-ID: <202501240959.61XLxBYF-lkp@intel.com>
References: <20250114-kcov-v1-4-004294b931a2@quicinc.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114-kcov-v1-4-004294b931a2@quicinc.com>

Hi Joey,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiao-Joey/kcov-introduce-new-kcov-KCOV_TRACE_UNIQ_PC-mode/20250114-133713
base:   9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe
patch link:    https://lore.kernel.org/r/20250114-kcov-v1-4-004294b931a2%40quicinc.com
patch subject: [PATCH 4/7] kcov: introduce new kcov KCOV_TRACE_UNIQ_CMP mode
config: mips-randconfig-r073-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240959.61XLxBYF-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240959.61XLxBYF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240959.61XLxBYF-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/kcov.c: In function 'kcov_map_add':
>> kernel/kcov.c:309:60: error: 'struct kcov_entry' has no member named 'type'
     309 |                         if (entry->ent == ent->ent && entry->type == ent->type &&
         |                                                            ^~
   kernel/kcov.c:309:73: error: 'struct kcov_entry' has no member named 'type'
     309 |                         if (entry->ent == ent->ent && entry->type == ent->type &&
         |                                                                         ^~
>> kernel/kcov.c:310:34: error: 'struct kcov_entry' has no member named 'arg1'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                  ^~
   kernel/kcov.c:310:47: error: 'struct kcov_entry' has no member named 'arg1'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                               ^~
>> kernel/kcov.c:310:62: error: 'struct kcov_entry' has no member named 'arg2'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                                              ^~
   kernel/kcov.c:310:75: error: 'struct kcov_entry' has no member named 'arg2'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                                                           ^~
   kernel/kcov.c:343:48: error: 'struct kcov_entry' has no member named 'type'
     343 |                         area[start_index] = ent->type;
         |                                                ^~
   kernel/kcov.c:344:52: error: 'struct kcov_entry' has no member named 'arg1'
     344 |                         area[start_index + 1] = ent->arg1;
         |                                                    ^~
   kernel/kcov.c:345:52: error: 'struct kcov_entry' has no member named 'arg2'
     345 |                         area[start_index + 2] = ent->arg2;
         |                                                    ^~


vim +309 kernel/kcov.c

   290	
   291	static notrace inline void kcov_map_add(struct kcov_map *map, struct kcov_entry *ent,
   292						struct task_struct *t, unsigned int mode)
   293	{
   294		struct kcov *kcov;
   295		struct kcov_entry *entry;
   296		unsigned int key = hash_key(ent);
   297		unsigned long pos, start_index, end_pos, max_pos, *area;
   298	
   299		kcov = t->kcov;
   300	
   301		if ((mode == KCOV_MODE_TRACE_UNIQ_PC ||
   302		     mode == KCOV_MODE_TRACE_UNIQ_EDGE))
   303			hash_for_each_possible_rcu(map->buckets, entry, node, key) {
   304				if (entry->ent == ent->ent)
   305					return;
   306			}
   307		else
   308			hash_for_each_possible_rcu(map->buckets, entry, node, key) {
 > 309				if (entry->ent == ent->ent && entry->type == ent->type &&
 > 310				    entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
   311					return;
   312				}
   313			}
   314	
   315		entry = (struct kcov_entry *)gen_pool_alloc(map->pool, 1 << MIN_POOL_ALLOC_ORDER);
   316		if (unlikely(!entry))
   317			return;
   318	
   319		barrier();
   320		memcpy(entry, ent, sizeof(*entry));
   321		hash_add_rcu(map->buckets, &entry->node, key);
   322	
   323		if (mode == KCOV_MODE_TRACE_UNIQ_PC || mode == KCOV_MODE_TRACE_UNIQ_CMP)
   324			area = t->kcov_area;
   325		else
   326			area = kcov->map_edge->area;
   327	
   328		pos = READ_ONCE(area[0]) + 1;
   329		if (mode == KCOV_MODE_TRACE_UNIQ_PC || mode == KCOV_MODE_TRACE_UNIQ_EDGE) {
   330			if (likely(pos < t->kcov_size)) {
   331				WRITE_ONCE(area[0], pos);
   332				barrier();
   333				area[pos] = ent->ent;
   334			}
   335		} else {
   336			start_index = 1 + (pos - 1) * KCOV_WORDS_PER_CMP;
   337			max_pos = t->kcov_size * sizeof(unsigned long);
   338			end_pos = (start_index + KCOV_WORDS_PER_CMP) * sizeof(u64);
   339			if (likely(end_pos <= max_pos)) {
   340				/* See comment in __sanitizer_cov_trace_pc(). */
   341				WRITE_ONCE(area[0], pos);
   342				barrier();
   343				area[start_index] = ent->type;
   344				area[start_index + 1] = ent->arg1;
   345				area[start_index + 2] = ent->arg2;
   346				area[start_index + 3] = ent->ent;
   347			}
   348		}
   349	}
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
